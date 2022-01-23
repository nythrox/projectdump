

export class UserDto {
    name: string;
    age: number;
    constructor(user: UserDto) {
      this.age = user.age;
      this.name = user.name;
    }
  }
  