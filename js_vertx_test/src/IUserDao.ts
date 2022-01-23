import { createInterface } from "./decorators";
import { UserModel } from "./UserModel";
export const IUserDao = createInterface("IUserDao");
export interface IUserDao {
  findAll(): UserModel[];
  findOne(id: string): UserModel;
}
