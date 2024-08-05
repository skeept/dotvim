#!/usr/bin/env -S deno run --no-check --allow-env=GIN_PROXY_ADDRESS --allow-net=127.0.0.1
import { pop, push } from "jsr:@lambdalisue/streamtools@^1.0.0";
import { ensure, is } from "jsr:@core/unknownutil@^4.0.0";

const resultPattern = /^([^:]+):(.*)$/;

const addr = JSON.parse(Deno.env.get("GIN_PROXY_ADDRESS") ?? "null");
if (!addr) {
  throw new Error("GIN_PROXY_ADDRESS environment variable is required");
}

const filename = Deno.args[0];
if (!filename) {
  throw new Error("No filename is specified to the editor");
}

const encoder = new TextEncoder();
const decoder = new TextDecoder();

const conn = await Deno.connect(addr);
await push(conn.writable, encoder.encode(`editor:${filename}`));
const result = decoder.decode(
  ensure(await pop(conn.readable), is.InstanceOf(Uint8Array)),
);
conn.close();

const m = result.match(resultPattern);
if (!m) {
  throw new Error(`Unexpected result '${result}' is received`);
}

const [status, value] = m.slice(1);
switch (status) {
  case "ok":
    Deno.exit(0);
    /* fall through */
  case "cancel":
    Deno.exit(1);
    /* fall through */
  case "err":
    console.error(value);
    Deno.exit(1);
    /* fall through */
  default:
    throw new Error(`Unexpected status '${status}' is received`);
}
