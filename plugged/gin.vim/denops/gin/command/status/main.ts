import type { Denops } from "https://deno.land/x/denops_std@v5.0.1/mod.ts";
import * as helper from "https://deno.land/x/denops_std@v5.0.1/helper/mod.ts";
import { assert, is } from "https://deno.land/x/unknownutil@v3.4.0/mod.ts#^";
import * as vars from "https://deno.land/x/denops_std@v5.0.1/variable/mod.ts";
import {
  builtinOpts,
  formatOpts,
  parse,
  validateFlags,
  validateOpts,
} from "https://deno.land/x/denops_std@v5.0.1/argument/mod.ts";
import {
  normCmdArgs,
  parseDisableDefaultArgs,
  parseSilent,
} from "../../util/cmd.ts";
import { exec } from "./command.ts";
import { edit } from "./edit.ts";

export function main(denops: Denops): void {
  denops.dispatcher = {
    ...denops.dispatcher,
    "status:command": (bang, mods, args) => {
      assert(bang, is.String, { message: "bang must be string" });
      assert(mods, is.String, { message: "mods must be string" });
      assert(args, is.ArrayOf(is.String), { message: "args must be string[]" });
      const [disableDefaultArgs, realArgs] = parseDisableDefaultArgs(args);
      const silent = parseSilent(mods);
      return helper.ensureSilent(denops, silent, () => {
        return helper.friendlyCall(
          denops,
          () =>
            command(denops, bang, mods, realArgs, {
              disableDefaultArgs,
            }),
        );
      });
    },
    "status:edit": (bufnr, bufname) => {
      assert(bufnr, is.Number, { message: "bufnr must be number" });
      assert(bufname, is.String, { message: "bufname must be string" });
      return helper.friendlyCall(denops, () => edit(denops, bufnr, bufname));
    },
  };
}

const allowedFlags = [
  "u",
  "untracked-files",
  "ignore-submodules",
  "ignored",
  "renames",
  "no-renames",
  "find-renames",
];

type CommandOptions = {
  disableDefaultArgs?: boolean;
};

async function command(
  denops: Denops,
  bang: string,
  mods: string,
  args: string[],
  options: CommandOptions = {},
): Promise<void> {
  if (!options.disableDefaultArgs) {
    const defaultArgs = await vars.g.get(
      denops,
      "gin_status_default_args",
      [],
    );
    assert(defaultArgs, is.ArrayOf(is.String), {
      message: "g:gin_status_default_args must be string[]",
    });
    args = [...defaultArgs, ...args];
  }
  const [opts, flags, residue] = parse(await normCmdArgs(denops, args));
  validateOpts(opts, [
    "worktree",
    "opener",
    ...builtinOpts,
  ]);
  validateFlags(flags, allowedFlags);
  await exec(denops, {
    worktree: opts.worktree,
    pathspecs: residue,
    flags,
    opener: opts.opener,
    cmdarg: formatOpts(opts, builtinOpts).join(" "),
    mods,
    bang: bang === "!",
  });
}
