import type { Denops } from "https://deno.land/x/denops_std@v3.9.0/mod.ts";
import * as fn from "https://deno.land/x/denops_std@v3.9.0/function/mod.ts";
import { parse as parseBufname } from "https://deno.land/x/denops_std@v3.9.0/bufname/mod.ts";
import { Silent } from "https://deno.land/x/denops_std@v3.9.0/helper/mod.ts";
import { GIN_FILE_BUFFER_PROTOCOLS } from "../global.ts";

export function parseSilent(mods: string): Silent {
  if (mods.indexOf("silent!") !== -1) {
    return "silent!";
  } else if (mods.indexOf("silent") !== -1) {
    return "silent";
  }
  return "";
}

export async function normCmdArgs(
  denops: Denops,
  args: string[],
): Promise<string[]> {
  // To reduce RPC, cache result of an arg which starts from '%' or '#'
  const cache: Map<string, Promise<string>> = new Map();
  return await Promise.all(args.map((arg) => normCmdArg(denops, arg, cache)));
}

async function normCmdArg(
  denops: Denops,
  arg: string,
  cache: Map<string, Promise<string>>,
): Promise<string> {
  if (cache.has(arg)) {
    return await cache.get(arg)!;
  }
  if (arg.startsWith("%") || arg.startsWith("#")) {
    const p = expand(denops, arg);
    cache.set(arg, p);
    return await p;
  }
  return arg.replaceAll(/^\\(%|#)/g, "$1");
}

export async function expand(denops: Denops, expr: string): Promise<string> {
  const bufname = await fn.expand(denops, expr) as string;
  try {
    const { scheme, fragment } = parseBufname(bufname);
    if (GIN_FILE_BUFFER_PROTOCOLS.includes(scheme)) {
      return fragment ?? bufname;
    }
  } catch {
    // Ignore errors
  }
  return bufname;
}
