import { QIO } from "@qio/core";
import { deepEqual } from "assert";
import {
  chain,
  chainFlex as chainW,
  constant,
  Do,
  Either,
  EitherAsync,
  flow,
  Left,
  map,
  pipe,
  Right,
  URIS,
} from "purifree-ts";
import { isValidUuid, Result } from "../uuid/Uuid";
class NotFoundError extends Error {}
type fn = (...args: any) => any;
type JustMethodKeys<T> = {
  [P in keyof T]: T[P] extends fn ? P : never;
}[keyof T];
type ExcludeMethods<T> = Omit<T, JustMethodKeys<T>>;

type PublicInterface<T> = ExcludeMethods<T>;

const _isValueObject = Symbol("isValueObject");
abstract class ValueObject<T extends Record<string, any>> {
  private [_isValueObject] = true;
  protected constructor(value: PublicInterface<T>) {}
  public equals(other?: T): boolean {
    if (other === null || other === undefined) {
      return false;
    }
    for (const key in this) {
      const thisKey = this[key];
      const otherKey = other[key];
      if (thisKey !== otherKey) {
        if (isValueObject(otherKey)) {
          if (otherKey.equals(thisKey)) {
            continue;
          }
        }
        return false;
      }
    }
    return JSON.stringify(this) === JSON.stringify(other);
  }
}

function isValueObject<T>(obj: any): obj is ValueObject<T> {
  return obj instanceof ValueObject;
}

const isEntity = (v: any): v is Entity<any> => {
  return v instanceof Entity;
};

export abstract class Entity<T extends { readonly id: any }> {
  public equals(object?: Entity<T>): object is Entity<T> {
    if (object == null || object == undefined) {
      return false;
    }

    if (this === object) {
      return true;
    }

    if (!isEntity(object)) {
      return false;
    }

    return (this as any).id === (object as any).id;
  }
}

class Actor extends Entity<Actor> {
  readonly id: string;
}
declare const fetchActorById: (id: ActorId) => Result<Actor, NotFoundError>;
// type ActorId = {
//   readonly value: string;
// };

export class ActorId extends ValueObject<ActorId> {
  readonly value: string;
  static of = flow(
    isValidUuid,
    map((id) => new ActorId({ value: id })),
  );
}

const v = ActorId.of("value");
// export const ActorId = (value: string) =>
//   pipe(
//     isValidUuid(value),
//     chainW(fetchActorById),
//     map(
//       constant({
//         value,
//       }),
//     ),
//   );

// export function ActorIdd(value: string) {
//   const valid = isValidUuid(value);
//   return valid.chain(fetchActorById).map((val) => ({
//     value,
//   }));
// }

class Email extends ValueObject<Email> {
  static create(email: string) {
    if (email.length < 18) {
      return Left(Error("errado"));
    }
    return Right(new Email({ value: email }));
  }

}

class User {
  email: Email
}

const email = Email.create("jason")

