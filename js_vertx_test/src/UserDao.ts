import { UserModel } from "./UserModel";
import { Injectable, Implements, Class } from './decorators';
import { IUserDao } from './IUserDao';

@Injectable
// @Implements(IUserDao)
export class UserDao implements IUserDao{
  findAll(): UserModel[] {
    return [{ id: "asdasd", name: "jason", age: 17 }];
  }
  findOne(id: string): UserModel {
    return { id, name: "sdasd" + id, age: 17 };
  }
}
// Class(UserDao).Implements(IUserDao)