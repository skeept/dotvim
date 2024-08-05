import type { Denops } from "jsr:@denops/std@^7.0.0";
import * as batch from "jsr:@denops/std@^7.0.0/batch";
import { alias, define, GatherCandidates, Range } from "./core.ts";

export type Candidate = { commitish: string };

export async function init(
  denops: Denops,
  bufnr: number,
  gatherCandidates: GatherCandidates<Candidate>,
): Promise<void> {
  await batch.batch(denops, async (denops) => {
    const openers = [
      "edit",
      "split",
      "vsplit",
      "tabedit",
    ];
    for (const opener of openers) {
      await define(
        denops,
        bufnr,
        `log:${opener}`,
        (denops, bufnr, range) =>
          doLog(denops, bufnr, range, opener, [], gatherCandidates),
      );
    }
    await alias(
      denops,
      bufnr,
      "log",
      "log:edit",
    );
  });
}

async function doLog(
  denops: Denops,
  bufnr: number,
  range: Range,
  opener: string,
  extraArgs: string[],
  gatherCandidates: GatherCandidates<Candidate>,
): Promise<void> {
  const xs = await gatherCandidates(denops, bufnr, range);
  for (const x of xs) {
    await denops.dispatch("gin", "log:command", "", "", [
      `++opener=${opener}`,
      ...extraArgs,
      x.commitish,
    ]);
  }
}
