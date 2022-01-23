import { createInterface } from "./decorators";
import { UserDto } from "./UserDto";
export const IUserService = createInterface("IUserService");
export interface IUserService {
  findAll(user: any): Promise<UserDto[]>;
  findOne(id: string): UserDto;
}
