import { defaultRuntime } from "@qio/core";
import { QIO } from "@qio/core/lib/main/QIO";
import { fail } from "assert";
import * as express from "express";
import * as logger from "morgan";
import * as path from "path";
import {
  ApKind,
  Do,
  Either,
  Left,
  List,
  pipe,
  ReplaceFirst,
  Right,
  sequence,
  SequenceableKind,
  sequenceT,
  Type,
} from "purifree-ts";

import { errorHandler, errorNotFoundHandler } from "./middlewares/errorHandler";
import { ActorId } from "./user/UserName";
import { Fail, Reader, Succeed } from "./uuid/Uuid";

// Create Express server
export const app = express();

// Express configuration
app.set("port", process.env.PORT || 3000);

app.use(logger("dev"));

app.use(errorNotFoundHandler);
app.use(errorHandler);

const id = ActorId("asdads");

interface Config {
  port: number;
}

const consoleLog = QIO.encase(console.log);
const ask = <T>() => QIO.access((env: T) => env);
class SpecificError extends Error {
  something: false;
}
class OtherError extends Error {
  smh: true;
}

const getMsg = (id: string) =>
  QIO.do(function* () {
    const env = yield* ask<Config>();
    const { name } = yield* ask<{ name: string }>();
    if (env.port > 500) {
      yield* Fail(new SpecificError("aha"));
    } else {
      yield* Fail(new OtherError("aha"));
    }
    yield* consoleLog("awaiting...");
    yield* QIO.timeout(void 0, 1000);
    yield* consoleLog("done awaiting!");
    return "Hi, " + name + "!";
  });

const provideEnv = (q: QIO<any, any, { port: number; name: string }>) =>
  q.provide({
    port: 100,
    name: "jsaon",
  });
const user = getMsg("10");

const exec = <A>(val: QIO<A, any, never>) =>
  defaultRuntime().unsafeExecutePromise(val);

const qio = QIO.do;

const result = QIO.sequence(
  List(getMsg("jason")),
  // List(getMsg("jason"), getMsg("jason"), getMsg("jason")),
);

const main = exec(
  qio(function* () {
    const usr = yield* user;
    const msgs = yield* result;
    return [usr, ...msgs];
  }),
);
// Type<
//   Ap["_URI"],(
//   ReplaceFirst<
//     Ap["_A"],
//     Type<Sequenceable["_URI"], ReplaceFirst<Values, Ap["_A"][0]>>
//   >
// >;
interface User {
  name: string;
  id: string;
}
const getUserFromSQL = (id: string) =>
  Succeed<User, Error>({ name: "jason", id });
type FindUser = typeof getUserFromSQL;

const userOrMessage = (user?: User) => {
  if (user) {
    return Succeed({ message: "success" });
  }
  return Fail({
    error: "user not found",
  });
};

const getUser = (findUser: FindUser) => (id: string) =>
  qio(function* () {
    const user = yield* findUser(id);
    return yield* userOrMessage(user);
  });
