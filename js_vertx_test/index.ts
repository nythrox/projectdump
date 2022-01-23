// /// <reference types="es4x" />
// // @ts-check
import { Router } from "@vertx/web";
import { Conquer, inversify } from "./src/conquer";
import { Vertx } from "@vertx/core";
import { UserController } from "./src/UserController";
import { UserDao } from "./src/UserDao";
import { constructorOf } from "./src/utils/objectUtils";
import "reflect-metadata";
import { UserService } from './src/UserService';
import { Class } from "./src/decorators";
import { IUserService } from "./src/IUserService";
import { IUserDao } from "./src/IUserDao";
declare const vertx: Vertx;

Class(UserService).Implements(IUserService);
Class(UserDao).Implements(IUserDao);

var server = vertx.createHttpServer();
var router = Router.router(vertx);

// UserService
// UserDao  
const userController = inversify.get(UserController);
console.log(userController);
console.log(userController.findAll({}).then((all) => console.log(all)));
// export const app = new Conquer(
//   {
//     controllers: [UserController],
//   },
//   router
// );

server.requestHandler(router.handle).listen(8080);

todo future: create a custom ts transformer
that has all types of reflection
(works on ALL classes in /src (not only imported onces)),
has variable namespace, types, extends, implements, mixins, etc
methods for identifying if class implements an interface (typeof, implementsOf())
parameter name and type (userId: number) will reflect findUser.prototype.metadata.parameters[0] = {
    name: "userId",
    type: number,
    index: 0
}
generate metadata for ALL properties of a class if the class is anotated
allow AOT annotation/reflection and enable tree shaking (like angular)