import { HttpException } from "./exceptions/http.exception";
import { HttpStatus } from "./exceptions/http-status.enum";
import { UserDao } from "./UserDao";
import { UserDto } from "./UserDto";
import {
  Controller,
  Get,
  Param,
  User,
  Authenticated,
  Injectable,
  Implements,
  Inject,
  Extends,
} from "./decorators";
import { IUserService } from "./IUserService";
import { IUserDao } from "./IUserDao";
import { Class } from "./conquer";

@Injectable
// @Implements(IUserService)
export class UserService implements IUserService {
  //   @Inject(IUserDao)
  @IUserDao
  userDao: IUserDao;

  async findAll(user: any): Promise<UserDto[]> {
    console.log(user);
    const res = this.userDao.findAll().map((model) => new UserDto(model));
    return res;
  }

  findOne(id: string): UserDto {
    if (id == "666") {
      throw new HttpException("aaaa 66 demonio diabo", HttpStatus.BAD_REQUEST);
    }
    return new UserDto(this.userDao.findOne(id));
  }
}
