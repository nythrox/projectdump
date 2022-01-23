import { QIO } from "@qio/core";
import { create } from "domain";
import {
  Either,
  GeneratableKind,
  Just,
  Left,
  Maybe,
  Nothing,
  ofSymbol,
  ReplaceFirst,
  SequenceableKind,
  Type,
} from "purifree-ts";
import { A, A, B } from "ts-toolbelt";
import { v4, validate } from "uuid";
import { makeCaseClass } from "../user/UserName";

// class _Uuid {
//   constructor(public readonly value: string) {}
// }
// const UuidC = makeCaseClass(_Uuid);
// type Uuid = ReturnType<typeof UuidC>;
// function Uuid(): Uuid;
// function Uuid(fromString: string): Either<Error, Uuid>;
// function Uuid(fromString?: string): any {
//   if (fromString) {
//     return validate(fromString)
//       ? Right(UuidC(fromString))
//       : Left(Error("failed to valdiate Uuid"));
//   }
//   return UuidC(v4());
// }

// export default Uuid;

export declare const QIO_URI = "Qio";
export declare type QIO_URI = typeof QIO_URI;
declare module "purifree-ts" {
  interface URI2HKT<Types extends any[]> {
    // [QIO_URI]: QIO<Types[0], Types[1], Types[2]>;
    [QIO_URI]: // [HasReturn,HasError, HasEnv]
    TypesToQIO<Types>;
  }
}

type TypesToQIO<
  Types extends any[],
  HasReturn = HasReturnType<Types> extends true ? true : never, // bug: HasReturnType<Types> extends true ? true : never works but HasReturnType<Types> extends true ? true : false doesnt
  HasError = Types[1] extends never ? false : never,
  HasEnv = Types[2] extends never ? false : never,
  A = Types[0],
  E = Types[1],
  R = Types[2]
> = And<HasReturn, And<HasError, HasEnv>> extends true
  ? QIO<A, E, R>
  : And<HasReturn, HasError> extends true
  ? Result<A, E>
  : And<HasReturn, HasEnv> extends true
  ? Reader<A, R>
  : IO<A>;
type And<A, B> = A extends true ? (B extends true ? true : false) : false;

type Not<T> = T extends true ? false : true;

type HasReturnType<T extends any[], Val = T[0]> = Val extends never
  ? false
  : Val extends void
  ? false
  : true;

type test = never extends any ? true : false;
declare module "@qio/core" {
  class QIO<A1 = unknown, E1 = never, R1 = never> {
    readonly _URI: QIO_URI;
    readonly _A: [A1, E1, R1];
    [Symbol.iterator]: () => Iterator<QIO<A1, E1, R1>, A1, any>;

    // static do<R>(
    //   fun: () => Generator<QIO<any, any, any>, R, any>,
    // ):

    static of: <A>(val: A) => QIO<A>;

    [ofSymbol]: <A>(val: A) => QIO<A>;

    ap<A2, E2, R2>(ab: QIO<(a: A1) => A2, E2, R2>): QIO<A2, E1 | R2, R1 & R2>;
    static sequence<
      Sequenceable extends SequenceableKind<
        any,
        [QIO<any, any, any>, ...any[]]
      >,
      Q extends QIO<any, any, any> = Sequenceable["_A"][0]
    >(
      sequenceable: Sequenceable,
    ): QIO<
      Type<Sequenceable["_URI"], ReplaceFirst<Sequenceable["_A"], Q["_A"][0]>>,
      Q["_A"][1],
      Q["_A"][2]
    >;
    static do<
      R = any,
      Qio = QIO<any, any, any>,
      L = Qio extends QIO<any, infer L> ? L : never,
      Env = Qio extends QIO<any, any, infer E> ? E : never,
      UnionEnv = UnionToIntersection<Env>
    >(
      fun: () => Generator<Qio, R, { value?: any; returnSelf: boolean }>,
    ): TypesToQIO<[R, L, Env extends never ? never : UnionEnv]>;
  }
}
type UnionToIntersection<U> = (U extends any ? (k: U) => void : never) extends (
  k: infer I,
) => void
  ? I
  : never;

// only result
export interface IO<A> extends QIO<A> {}
// result or error
export interface Result<Success, Error> extends QIO<Success, Error> {}
export interface Reader<A, Env> extends QIO<A, never, Env> {}
export interface Effect<A, Err, Env> extends QIO<A, Err, Env> {}
export const Succeed: <Success, Error = never>(
  val: Success,
) => Result<Success, Error> = QIO.resolve;
export const Fail: <Error, Success = never>(
  val: Error,
) => Result<Success, Error> = QIO.reject;

export const isValidUuid = (value: string): Result<string, Error> =>
  validate(value) ? Succeed(value) : Fail(new Error("invalid UUID"));
