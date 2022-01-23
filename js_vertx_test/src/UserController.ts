import { HttpException } from "./exceptions/http.exception";
import { HttpStatus } from "./exceptions/http-status.enum";
import { UserDao } from "./UserDao";
import { UserDto } from "./UserDto";
import { Controller, Get, Param, User, Authenticated, Inject } from "./decorators";
import { IUserService } from "./IUserService";
// @injectable()
// @Authenticated
@Controller("users")
export class UserController {
  // @IUserService

  @Inject(IUserService)
  userService: IUserService;

  @Authenticated
  @Get("/")
  async findAll(@User user: any): Promise<UserDto[]> {
    console.log(this.userService);
    return this.userService.findAll(user);
  }
  @Get("/:id")
  findOne(@Param("id") id: string): UserDto {
    return this.userService.findOne(id);
  }
}
