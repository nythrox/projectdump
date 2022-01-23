"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
/// <reference types="es4x" />
// @ts-checkimport { RoutingContext, Router } from "@vertx/web";
require("reflect-metadata");
require("@vertx/web");
const web_1 = require("@vertx/web");
const decorators_1 = require("./decorators");
const inversify_1 = require("inversify");
exports.inversify = new inversify_1.Container({ defaultScope: "Singleton", autoBindInjectable: true });
class Conquer {
    constructor(options = {}, vertxRouter) {
        var _a, _b;
        this.vertxRouter = vertxRouter !== null && vertxRouter !== void 0 ? vertxRouter : web_1.Router.router(vertx);
        const allRoutes = this.vertxRouter.route();
        allRoutes.handler((ctx) => {
            console.log("adding application/json");
            ctx
                .response()
                .putHeader("content-type", "application/json; charset=utf-8");
            ctx.next();
        });
        (_a = options.middleware) === null || _a === void 0 ? void 0 : _a.forEach((handler) => {
            allRoutes.handler(handler);
        });
        (_b = options.controllers) === null || _b === void 0 ? void 0 : _b.forEach((controller) => {
            var _a, _b;
            let instance;
            try {
                instance = exports.inversify.resolve(controller);
            }
            catch (e) {
                console.error(e);
            }
            let baseRoute;
            try {
                baseRoute = Reflect.getMetadata(decorators_1.CONTROLLER_METADATA.baseUrl, instance);
            }
            catch (e) {
                console.error(e);
            }
            let controllerMiddleware;
            try {
                controllerMiddleware = (_a = Reflect.getMetadata(decorators_1.CONTROLLER_METADATA.middleware, instance)) !== null && _a !== void 0 ? _a : [];
            }
            catch (e) {
                console.error(e);
            }
            let routes;
            try {
                routes = ((_b = Reflect.getMetadata(decorators_1.CONTROLLER_METADATA.routes, instance)) !== null && _b !== void 0 ? _b : []);
            }
            catch (e) {
                console.error(e);
            }
            controllerMiddleware.forEach((middleware) => {
                console.log("adding middleware ", middleware.name, " to ", "/" + baseRoute);
                this.vertxRouter.route("/" + baseRoute + "/*").handler(middleware);
            });
            routes.map((route) => {
                var _a;
                const { parameters: params, method: httpMethod, url } = route;
                const method = instance[route.functionName];
                let pipes;
                try {
                    pipes = (_a = Reflect.getMetadata(decorators_1.PARAM_METADATA.pipes, instance, method.name)) !== null && _a !== void 0 ? _a : [];
                }
                catch (e) {
                    console.error(e);
                }
                console.log(httpMethod, "/" + baseRoute + url);
                this.vertxRouter
                    .route(httpMethod, "/" + baseRoute + url)
                    .handler((ctx) => __awaiter(this, void 0, void 0, function* () {
                    try {
                        const args = pipes.map((pipe) => pipe(ctx));
                        console.log(args);
                        const response = yield method.apply(instance, args);
                        const jsonRes = JSON.stringify({ data: response });
                        ctx
                            .response()
                            .putHeader("Content-Length", jsonRes.length.toString());
                        ctx.response().write(jsonRes);
                    }
                    catch (e) {
                        try {
                            ctx.fail(e.getStatus(), new Error(e.getResponse().toString()));
                        }
                        catch (e) {
                            console.log(e);
                        }
                    }
                }))
                    .handler((ctx) => {
                    ctx.response().end();
                });
            });
        });
        this.vertxRouter.errorHandler(500, (ctx) => {
            var _a;
            console.log("error hadnlr");
            const e = ctx.failure();
            const jsonRes = JSON.stringify({
                error: {
                    message: (_a = e.message) !== null && _a !== void 0 ? _a : e.toString(),
                    stack: e.stack,
                    statusCode: ctx.statusCode(),
                    name: e.name,
                },
            });
            ctx.response().end(jsonRes);
            console.log("failure");
        });
    }
}
exports.Conquer = Conquer;
function toClass(Class) {
    return Class;
}
function Seila() { }
function isPromise(f) {
    return f.then != null;
}
exports.isPromise = isPromise;
// type InstanceTypes<T extends Class[]> = {
//   [P in keyof T]: T[P] extends Class ? InstanceType<T[P]> : never;
// } & {
//   [Symbol.iterator]: any;
// };
// const createInstances = <T extends Class[]>(...ctors: T): InstanceTypes<T> =>
//   undefined as any;
// const [firstClass, secondClass, userd, v] = createInstances(
//   UserController,
//   UserDao,
//   Conquer
// );
//# sourceMappingURL=conquer.js.map