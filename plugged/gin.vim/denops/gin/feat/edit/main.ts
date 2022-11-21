import type { Denops } from "https://deno.land/x/denops_std@v3.9.3/mod.ts";
import * as unknownutil from "https://deno.land/x/unknownutil@v2.1.0/mod.ts";
import * as helper from "https://deno.land/x/denops_std@v3.9.3/helper/mod.ts";
import { parseSilent } from "../../util/cmd.ts";
import { command } from "./command.ts";
import { edit } from "./edit.ts";
import { read } from "./read.ts";
import { write } from "./write.ts";

export function main(denops: Denops): void {
  denops.dispatcher = {
    ...denops.dispatcher,
    "edit:command": (bang, mods, args) => {
      unknownutil.assertString(mods);
      unknownutil.assertArray(args, unknownutil.isString);
      const silent = parseSilent(mods);
      return helper.ensureSilent(denops, silent, () => {
        return helper.friendlyCall(denops, () =>
          command(denops, mods, args, {
            disableDefaultArgs: bang === "!",
          }));
      });
    },
    "edit:edit": (bufnr, bufname) => {
      unknownutil.assertNumber(bufnr);
      unknownutil.assertString(bufname);
      return helper.friendlyCall(denops, () => edit(denops, bufnr, bufname));
    },
    "edit:read": (bufnr, bufname) => {
      unknownutil.assertNumber(bufnr);
      unknownutil.assertString(bufname);
      return helper.friendlyCall(denops, () => read(denops, bufnr, bufname));
    },
    "edit:write": (bufnr, bufname) => {
      unknownutil.assertNumber(bufnr);
      unknownutil.assertString(bufname);
      return helper.friendlyCall(denops, () => write(denops, bufnr, bufname));
    },
  };
}
