import type { Denops } from "https://deno.land/x/denops_std@v3.3.0/mod.ts";
import * as helper from "https://deno.land/x/denops_std@v3.3.0/helper/mod.ts";
import * as unknownutil from "https://deno.land/x/unknownutil@v2.0.0/mod.ts";
import { command, read } from "./command.ts";

export function main(denops: Denops): void {
  denops.dispatcher = {
    ...denops.dispatcher,
    "branch:command": (...args) => {
      unknownutil.assertArray(args, unknownutil.isString);
      return helper.friendlyCall(denops, () => command(denops, args));
    },
    "branch:read": () => read(denops),
  };
}
