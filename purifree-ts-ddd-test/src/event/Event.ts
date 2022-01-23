import { Left, Right } from "purifree-ts";
import { ActorId } from "../actor/ActorId";

export class Event {
  actorId: ActorId;
  createdAt: EventCreatedAt;
  name: EventName;
}
const registerEvent = () => {}
export class EventCreatedAt {
  private isEventCreatedAt = true as const;
  private constructor(public value: Date) {}
  static of(date: Date) {
    if (date.getFullYear() < 1950) {
      return Left("Invalid Date");
    }
    return Right(new EventCreatedAt(date));
  }
}

export class EventName {
  private isEventName = true as const;
  private constructor(public value: string) {}

  static of(name: string) {
    if (name.length < 3 || name.length > 100) {
      return Left("Invalid event name");
    }
    return Right(name);
  }
}


interface Somet  {
    value: boolean
}
const v : Somet = {
    value: 10
}