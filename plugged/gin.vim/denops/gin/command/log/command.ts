import type { Denops } from "https://deno.land/x/denops_std@v4.1.0/mod.ts";
import * as path from "https://deno.land/std@0.180.0/path/mod.ts";
import { unnullish } from "https://deno.land/x/unnullish@v1.0.0/mod.ts";
import * as buffer from "https://deno.land/x/denops_std@v4.1.0/buffer/mod.ts";
import * as option from "https://deno.land/x/denops_std@v4.1.0/option/mod.ts";
import {
  format as formatBufname,
} from "https://deno.land/x/denops_std@v4.1.0/bufname/mod.ts";
import { Flags } from "https://deno.land/x/denops_std@v4.1.0/argument/mod.ts";
import { findWorktreeFromDenops } from "../../git/worktree.ts";

export type ExecOptions = {
  worktree?: string;
  commitish?: string;
  paths?: string[];
  flags?: Flags;
  opener?: string;
  cmdarg?: string;
  mods?: string;
  bang?: boolean;
};

export async function exec(
  denops: Denops,
  options: ExecOptions = {},
): Promise<buffer.OpenResult> {
  const verbose = await option.verbose.get(denops);

  const worktree = await findWorktreeFromDenops(denops, {
    worktree: options.worktree,
    verbose: !!verbose,
  });

  const paths = options.paths?.map((p) =>
    path.isAbsolute(p) ? path.relative(worktree, p) : p
  );

  const bufname = formatBufname({
    scheme: "ginlog",
    expr: worktree,
    params: {
      ...options.flags ?? {},
      commitish: options.commitish,
    },
    fragment: unnullish(paths, JSON.stringify),
  });
  return await buffer.open(denops, bufname, {
    opener: options.opener,
    cmdarg: options.cmdarg,
    mods: options.mods,
    bang: options.bang,
  });
}
