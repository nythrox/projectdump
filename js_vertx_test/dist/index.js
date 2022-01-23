"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
// /// <reference types="es4x" />
// // @ts-check
const web_1 = require("@vertx/web");
const conquer_1 = require("./src/conquer");
const UserController_1 = require("./src/UserController");
const UserDao_1 = require("./src/UserDao");
require("reflect-metadata");
const UserService_1 = require("./src/UserService");
const decorators_1 = require("./src/decorators");
const IUserService_1 = require("./src/IUserService");
const IUserDao_1 = require("./src/IUserDao");
decorators_1.Class(UserService_1.UserService).Implements(IUserService_1.IUserService);
decorators_1.Class(UserDao_1.UserDao).Implements(IUserDao_1.IUserDao);
var server = vertx.createHttpServer();
var router = web_1.Router.router(vertx);
// UserService
// UserDao  
const userController = conquer_1.inversify.get(UserController_1.UserController);
console.log(userController);
console.log(userController.findAll({}).then((all) => console.log(all)));
// export const app = new Conquer(
//   {
//     controllers: [UserController],
//   },
//   router
// );
server.requestHandler(router.handle).listen(8080);
//# sourceMappingURL=index.js.map