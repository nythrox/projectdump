/// <reference types="es4x" />
// @ts-checkimport { RoutingContext, Router } from "@vertx/web";
import "reflect-metadata";
import "@vertx/web";
import { Router, RoutingContext, Route } from "@vertx/web";
import { Vertx, Handler } from "@vertx/core";
import { HttpMethod } from "@vertx/core/enums";
import { UserController } from "./UserController";
import { UserDao } from "./UserDao";
import { Type } from "./utils/domain";
import { CONTROLLER_METADATA, Middleware, PARAM_METADATA } from "./decorators";
import { HttpException } from "./exceptions/http.exception";

import { Container } from "inversify";
export const inversify = new Container({
  defaultScope: "Singleton",
  autoBindInjectable: true,
});
export interface ConquerInitOptions {
  controllers?: Class[];
  middleware?: Middleware<void>[];
}

export type RouteHandler = {
  method: HttpMethod;
  url: string;
  functionName: string;
  parameters: Parameter[];
};
export type Parameter = {
  type: any;
};

export class Conquer {
  private vertxRouter: Router;
  constructor(options: ConquerInitOptions = {}, vertxRouter?: Router) {
    this.vertxRouter = vertxRouter ?? Router.router(vertx);
    const allRoutes = this.vertxRouter.route();
    allRoutes.handler((ctx) => {
      console.log("adding application/json");
      ctx
        .response()
        .putHeader("content-type", "application/json; charset=utf-8");
      ctx.next();
    });
    options.middleware?.forEach((handler) => {
      allRoutes.handler(handler);
    });
    options.controllers?.forEach((controller) => {
      let instance: { [P in string]: any };
      try {
        instance = inversify.resolve(controller);
      } catch (e) {
        console.error(e);
      }
      let baseRoute: string;
      try {
        baseRoute = Reflect.getMetadata(
          CONTROLLER_METADATA.baseUrl,
          instance
        ) as string;
      } catch (e) {
        console.error(e);
      }
      let controllerMiddleware: Middleware<void>[];
      try {
        controllerMiddleware =
          Reflect.getMetadata(CONTROLLER_METADATA.middleware, instance) ?? [];
      } catch (e) {
        console.error(e);
      }
      let routes: RouteHandler[];
      try {
        routes = (Reflect.getMetadata(CONTROLLER_METADATA.routes, instance) ??
          []) as RouteHandler[];
      } catch (e) {
        console.error(e);
      }
      controllerMiddleware.forEach((middleware) => {
        console.log(
          "adding middleware ",
          middleware.name,
          " to ",
          "/" + baseRoute
        );
        this.vertxRouter.route("/" + baseRoute + "/*").handler(middleware);
      });
      routes.map((route) => {
        const { parameters: params, method: httpMethod, url } = route;
        const method = instance[route.functionName] as Function;
        let pipes: Middleware<any>[];
        try {
          pipes =
            Reflect.getMetadata(PARAM_METADATA.pipes, instance, method.name) ??
            [];
        } catch (e) {
          console.error(e);
        }
        console.log(httpMethod, "/" + baseRoute + url);
        this.vertxRouter
          .route(httpMethod, "/" + baseRoute + url)
          .handler(async (ctx) => {
            try {
              const args = pipes.map((pipe) => pipe(ctx));
              console.log(args);
              const response = await method.apply(instance, args);
              const jsonRes = JSON.stringify({ data: response });
              ctx
                .response()
                .putHeader("Content-Length", jsonRes.length.toString());
              ctx.response().write(jsonRes);
            } catch (e) {
              try {
                ctx.fail(
                  (e as HttpException).getStatus(),
                  new Error((e as HttpException).getResponse().toString())
                );
              } catch (e) {
                console.log(e);
              }
            }
          })
          .handler((ctx) => {
            ctx.response().end();
          });
      });
    });
    this.vertxRouter.errorHandler(500, (ctx) => {
      console.log("error hadnlr");
      const e = ctx.failure();
      const jsonRes = JSON.stringify({
        error: {
          message: e.message ?? e.toString(),
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

// declare function bindNew<C extends { new (...args: A): T }, A extends any[], T>(
//   Class: C & { new (...args: A): T }
// ): C & ((...args: A) => T);

// const UserDDao = bindNew(UserController);

export type Klass<C extends { new (...args: A): T }, A extends any[], T> = {
  new (...args: A): C;
};
function toClass<C extends { new (...args: A): T }, A extends any[], T>(
  Class: C & { new (...args: A): T }
): C {
  return Class;
}
// type params = ConstructorParameters<typeof UserController>;
// type p = Parameters<Seila>;
// type r = ReturnType<Seila>;
// type i = InstanceType<typeof UserController>;
export type Class<T = {}> = T extends new (...args: any) => any
  ? Abstract<T> & TypedConstructor<T>
  : Abstract<T> & UntypedConstructor<T>;
export interface UntypedConstructor<C = {}, A extends any[] = any[]> {
  // new (...args: { [P in keyof A]: A[P] }): C;
  new (...args: A): C;
}
export type UnClass<T> = T extends Class<infer R> ? R : T;

type Abstract<T = {}> = Function & { prototype: T };

export interface TypedConstructor<
  T extends new (...args: any) => {},
  A extends any[] = ConstructorParameters<T>
> {
  new (...args: A): InstanceType<T>;
}
// export interface Constructor<T extends any[], R> {
//   (
//     ...args: {
//       [P in keyof T]: T[P];
//     }
//   ): R;
// }

export function isPromise(f: any): f is Promise<any> {
  return (f as Promise<any>).then != null;
}
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
