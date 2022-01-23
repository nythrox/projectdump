import { Brand, Brander, make } from "ts-brand";
import {
  chainFlex as chainW,
  constant,
  map,
  Maybe,
  Nothing,
  pipe,
  Right,
} from "purifree-ts";
// import { Any } from "ts-toolbelt";

import { Any } from "ts-toolbelt";
import { isValidUuid, Result } from "../uuid/Uuid";

// const CaseClass: ClassDecorator = (klass) => {
//   klass.prototype.equals = function (other: any) {
//     return other.constructor === klass && deepEqual(this, other);
//   };
//   return Object.assign(klass, (...args: any) => {
//     return new (klass as any)(...args);
//   });
// };

// @CaseClass
// class UserName implements Comparable<typeof UserName, UserName> {
//   name: string;
//   constructor(private age: string) {}
//   equals!: (other: UserName) => boolean;
// }
// type Comparable<T extends newable, T2> = {
//   equals(other: T2): boolean;
//   (...args: ConstructorParameters<T>): T2;
// };

// const isComparable = (obj: any): obj is Comparable<any> => {
//   return !!obj.equals;
// };s
// type newable = { new (...args: any[]): any } & Function;
// export const makeCaseClass = <
//   T extends newable,
//   //   Args extends any[] = T extends new (...args: infer Args) => any
//   //     ? Args
//   //     : never,
//   InstanceType = T extends new (...args: any[]) => infer R ? R : never,
//   N = Any.Compute<Readonly<InstanceType> & NewInstanceType<InstanceType>>
// >(
//   klass: T,
// ): {
//   //   new (never: never, ...args: never[]): never; // constructor so syntax highlighting will be green
//   // (...args: Args): N;
//   (value: InstanceType): N;
//   // equals: (a: NewInstanceType, b: NewInstanceType) => boolean;
// } => {
//   //   klass.prototype.equals = function (other: InstanceType) {
//   //     return other.constructor === UserName && deepEqual(this, other);
//   //   };

//   return Object.assign(klass, (...args: any) => {
//     return new klass(...args);
//   }) as any;
// };
// interface NewInstanceType<T> {
//   equals(other: T): boolean;
// }

// const user = makeCaseClass(
//   class User {
//     name: string;
//   },
// );
// type User = ReturnType<typeof user>;

// const User = (name?: string): Maybe<User> => {
//   if (name) {
//     return Right(user({ name })) as any;
//   }
//   return Nothing;
// };

// const UserNameObj = makeCaseClass(UserName);
// const res = UserNameObj("hello");
// const l = {
//   ...res,
//   name: "hello",
// };

// function deepEqual(object1: Record<string, any>, object2: Record<string, any>) {
//   const keys1 = Object.keys(object1);
//   const keys2 = Object.keys(object2);

//   if (keys1.length !== keys2.length) {
//     return false;
//   }

//   for (const key of keys1) {
//     const val1 = object1[key];
//     const val2 = object2[key];
//     const areObjects = isObject(val1) && isObject(val2);
//     if (areObjects) {
//       const areComparables = isComparable(val1) && isComparable(val2);
//       if (areComparables) {
//         return val1.equals(val2);
//       }
//     }
//     if (
//       (areObjects && !deepEqual(val1, val2)) ||
//       (!areObjects && val1 !== val2)
//     ) {
//       return false;
//     }
//   }

//   return true;
// }

// function isObject(object: any): object is Record<string, any> {
//   return object != null && typeof object === "object";
// }

// const Case = <
//   Cl extends newable,
//   InstanceType,
//   Args extends any[],
//   N = Any.Compute<
//     Readonly<InstanceType> & {
//       equals(other: InstanceType): boolean;
//     }
//   >,
//   C = (vals: InstanceType) => N,
//   R = any
// >(
//   Class: { new (...args: any): InstanceType } & Cl,
//   Constructor: (Class: C) => (...args: Args) => R,
// ): Any.Compute<ReturnType<typeof Constructor> & { __type: N }> => {
//   return 0 as any;
// };
// export type User = typeof User["__type"];

// const User = Case(
//   class User {
//     name!: string;
//   },
//   (User) => (name?: string): Maybe<ReturnType<typeof User>> => {
//     if (name) {
//       return Right(User({ name })) as any;
//     }
//     return Nothing;
//   },
// );
// const me = User("jason");

// const test = (k: newable) => {
//   return class hi extends k {
//     me: "jason";
//   };
// };

// const v = test(class Hi {});

// export interface UserB {
//   id: UserId;
//   name: string;
// }

// export type UserId = Brand<number, UserB, "id">;
// export const UserId = make<UserId>();

// export interface Post {
//   id: PostId;
//   numbers: PostNumbers;
//   authorId: UserId;
//   title: string;
//   body: string;
// }
type GetType<T extends { __type__: any }> = T extends { __type__: infer U }
  ? U
  : never;

const CaseClass = <S extends string, T, B = Brand<T, T, S>>(
  s: S,
): [
  Brander<B> & {
    __type__: B;
  },
  isUser: (obj: any) => obj is B,
  equals: (obj1: B, obj2: B) => boolean,
] => {
  return 0 as any;
};

// const user_uri = "user";
// const [user, isUser, equals] = CaseClass<
//   typeof user_uri,
//   { name: string; age: number }
// >(user_uri);
// type User = GetType<typeof user>;

// const [userId, isUserId, userIdEquals] = CaseClass<"userId", string>("userId");

// type UserId = GetType<typeof userId>;

// function getUserr(userId: UserId): User {
//   return user({
//     name: userId,
//     age: 10,
//   });
// }
// const v = getUserr(userId("10"));

export type PostId = Brand<number, number, "id">;
// // export type PostNumbers = Brand<number, Post, "numbers">;
// export const PostNumbers = make<PostNumbers>();
export const PostId = make<PostId>();

// declare function getPost(id: PostId): Promise<Post>;
// declare function getUser(id: UserId): Promise<UserB>;
// getPost(PostId(10));
// getUser(UserId(10));

const [actorId, isActorId, actorIdEquals] = CaseClass<"actorId", string>(
  "actorId",
);
type ActorId = GetType<typeof actorId>;
class Actor {}
export declare const fetchActorById: (id: ActorId) => Result<Actor, Error>;
export const ActorId = (value: string) =>
  pipe(
    isValidUuid(value),
    chainW(fetchActorById),
    map(constant(actorId(value) as ActorId)),
  );
