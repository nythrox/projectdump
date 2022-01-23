import { HttpMethod } from "@vertx/core/enums";
import { Class, RouteHandler, Parameter, inversify } from "./conquer";
import { UserController } from "./UserController";
import { toStringConstructor } from "./utils/objectUtils";
import { UserDao } from "./UserDao";
import { applyClassDecorators } from "./utils/decoratorUtilts";
import {
  HttpServerRequest,
  HttpServerResponse,
  Vertx,
  Buffer,
  Cookie,
} from "@vertx/core";
import { RoutingContext, FileUpload, Session } from "@vertx/web";
import { UnauthorizedException } from "./exceptions/unauthorized.exception";
import { injectable, inject } from "inversify";

function Request(url?: string, method: HttpMethod = HttpMethod.GET) {
  const decorator: MethodDecorator = function <T>(
    target: Class,
    propertyKey: string,
    descriptor: TypedPropertyDescriptor<T>
  ) {
    let finalUrl: string;
    if (url) {
      finalUrl = url === "/" ? "" : url.startsWith("/") ? url : "/" + url;
    } else {
      finalUrl = "/" + propertyKey;
    }
    const parameters = ((Reflect.getMetadata(
      "design:paramtypes",
      target,
      propertyKey
    ) ?? []) as any[]).map<Parameter>((param: any) => ({
      type: param,
    }));
    const routes: RouteHandler[] =
      Reflect.getMetadata(CONTROLLER_METADATA.routes, target) ?? [];
    routes.push({
      url: finalUrl,
      method,
      functionName: propertyKey,
      parameters: parameters,
    });
    // target.prototype.__reflections___.routes = routes;
    Reflect.defineMetadata(CONTROLLER_METADATA.routes, routes, target);
    return descriptor;
  };
  return decorator;
}

export function Get(url?: string) {
  return Request(url, HttpMethod.GET);
}
export function Post(url?: string) {
  return Request(url, HttpMethod.POST);
}
export function Connect(url?: string) {
  return Request(url, HttpMethod.CONNECT);
}
export function Delete(url?: string) {
  return Request(url, HttpMethod.DELETE);
}
export function Head(url?: string) {
  return Request(url, HttpMethod.HEAD);
}
export function Options(url?: string) {
  return Request(url, HttpMethod.OPTIONS);
}
export function Other(url?: string) {
  return Request(url, HttpMethod.OTHER);
}
export function Patch(url?: string) {
  return Request(url, HttpMethod.PATCH);
}
export function Put(url?: string) {
  return Request(url, HttpMethod.PUT);
}
export function Trace(url?: string) {
  return Request(url, HttpMethod.TRACE);
}

// const h = Injector.resolve(UserController);

// console.log("h:", h);
export enum CONTROLLER_METADATA {
  baseUrl = "conquer:controller.baseUrl",
  routes = "conquer:controller.routes",
  middleware = "conquer:controller.midleware",
}
export enum PARAM_METADATA {
  pipes = "conquer:param.pipes",
}
export enum ROUTE_METADATA {
  middleware = "conquer:param.middleware",
}
export type GenericClassDecorator<T> = (target: T) => void;

export function Controller(baseUrl?: string) {
  return <T>(target: Class<T>) => {
    injectable()(target);
    Reflect.metadata(
      CONTROLLER_METADATA.baseUrl,
      baseUrl ??
        target.name.replace(new RegExp("Controller\\w*"), "").toLowerCase()
    )(target.prototype);
  };
}

// function addControllerMetadata(originalClass: T) {
//   return class extends originalClass implements Controller {
//     routes: RouteHandler[] = [];
//     baseUrl = baseUrl ?? "/";
//   };
// };
export interface ArgumentMetadata {
  readonly type: Paramtype;
  readonly metatype?: Class | undefined;
}

export type Middleware<T> = (ctx: RoutingContext) => T;
export function createClassDecorator(f: Middleware<void>) {
  return <T extends Class>(target: T) => {
    const middleware =
      Reflect.getMetadata(CONTROLLER_METADATA.middleware, target) ?? [];
    middleware.push(f);
    Reflect.defineMetadata(
      CONTROLLER_METADATA.middleware,
      middleware,
      target.prototype
    );
    return target;
  };
}
export function createParamDecorator<T>(f: Middleware<T>) {
  return (
    target: any,
    propertyKey: string | symbol,
    parameterIndex: number
  ): void => {
    const params =
      Reflect.getMetadata(PARAM_METADATA.pipes, target, propertyKey) ?? [];
    params[parameterIndex] = f;
    Reflect.defineMetadata(PARAM_METADATA.pipes, params, target, propertyKey);
    // console.log(target[propertyKey].name, 'index: ', parameterIndex,'value:',f, 'total: ', Reflect.getMetadata(PARAM_METADATA.pipes, target, propertyKey) )
  };
}
export function createRouteDecorator(f: Middleware<void>) {
  return function <T>(
    target: any,
    propertyKey: string | symbol,
    descriptor: TypedPropertyDescriptor<T>
  ) {
    const middleware =
      Reflect.getMetadata(ROUTE_METADATA.middleware, target, propertyKey) ?? [];
    middleware.push(f);
    Reflect.defineMetadata(
      ROUTE_METADATA.middleware,
      middleware,
      target,
      propertyKey
    );
    return descriptor;
  };
}
export function Authenticated<T extends Class>(target: T): T;
export function Authenticated<T>(
  target: Object,
  propertyKey: string | symbol,
  descriptor: TypedPropertyDescriptor<T>
): TypedPropertyDescriptor<T>;
export function Authenticated<T>(
  arg1: T | Object,
  arg2?: never | (string | symbol),
  arg3?: never | TypedPropertyDescriptor<T>
): T | TypedPropertyDescriptor<T> {
  const hasUser = (ctx: RoutingContext) => {
    const user = ctx.user();
    if (!user) {
      throw new UnauthorizedException();
    }
  };
  if (arg2 && arg3) {
    return createRouteDecorator(hasUser)(arg1, arg2, arg3);
  }
  return createClassDecorator(hasUser)(arg1 as Class) as any;
}

// export const Authenticated = createRouteDecorator((ctx) => {
//   const user = ctx.user();
//   if (!user) {
//     throw new UnauthorizedException();
//   }
// });

export const Body = createParamDecorator((ctx) => {
  return ctx.getBodyAsJson();
});
export const User = createParamDecorator((ctx) => {
  return ctx.user();
});
export const Context = createParamDecorator((ctx) => {
  return ctx;
});
export const Req = createParamDecorator((ctx) => {
  return ctx.request();
});
export const Res = createParamDecorator((ctx) => {
  return ctx.response();
});

export const Param = (name: string) => {
  return createParamDecorator((ctx) => {
    return ctx.request().getParam(name);
  });
};

class Paramtype {
  // static req = HttpServerRequest
  // static res = HttpServerResponse
  // static context = RoutingContext
  // static vertx = Vertx
  // static body = Buffer
  // static cookies = Cookie[]
  // static fileUploads = FileUpload[]
  // static session = Session
  // static user = User
  // static failure = Error
  // static statusCode = number
  // static data = Data
}
export function Injectable(target: Class<any>) {
  injectable()(target);
  return target;
}

export function Inject(
  type: Class<any> | Interface
): (target: Object, propertyKey: string) => void;
export function Inject(target: Object, propertyKey: string): void;
export function Inject(
  arg1: Object | (Class<any> | PropertyDecorator),
  propertyKey?: string
): (target: Object, propertyKey: string) => void | void {
  if (propertyKey) {
    return _Inject;
  }
  if (isInterface(arg1)) {
    return inject(arg1());
  }
  return inject(arg1 as Class<any>);
}
function isInterface(obj: any): obj is Interface {
  return (obj as Interface).name === "_interface";
}
export function _Inject(target: Object, propertyKey: string) {
  const type = Reflect.getMetadata("design:type", target, propertyKey);
  inject(type)(target, propertyKey);
}
export function createInterface(name: string): Interface {
  const symbol = Symbol.for(name);
  function _interface(target: Object, propertyKey: string): void;
  function _interface(): symbol;
  function _interface(target?: Object, propertyKey?: string): void | symbol {
    if (target && propertyKey) {
      console.log(`
          CLASS ${target.constructor.name} IS
          SEARCHING FOR ${symbol.toString()}
          `);
      inject(symbol)(target, propertyKey);
    } else {
      return symbol;
    }
  }
  return _interface;
}
type DescribableClass<T extends Class> = {
  Implements(...interfaces: Array<Interface>): DescribableClass<T>;
  Extends(...classes: Array<Class>): DescribableClass<T>;
  Mixins(...mixins: Array<Class>): DescribableClass<T>;
} & T;
export function Class<T extends Class>(c: T): DescribableClass<T> {
  const Class: DescribableClass<T> = c as any;
  Class.Implements = function (...interfaces) {
    interfaces.forEach((i) => {
      inversify.bind(i()).to(Class);
    });
    return Class;
  };
  Class.Extends = function (...classes) {
    classes.forEach((i) => {
      inversify.bind(i).to(Class);
    });
    return Class;
  };
  return Class;
}
export function Implements(...interfaces: Array<Interface>) {
  return (target: Class) => {
    console.log(`
    REGISTERING ${target.name}
    TO ${interfaces.map((i) => i().toString()).join(" ")}
    `);
    interfaces.forEach((i) => {
      inversify.bind(i()).to(target);
    });
  };
}

export function Extends(...classes: Array<Class>) {
  return (target: Class) => {
    console.log(`
    REGISTERING ${target.name}
    TO ${classes.map((i) => i.toString()).join(" ")}
    `);
    classes.forEach((i) => {
      inversify.bind(i).to(target);
    });
  };
}

// interface Interface {
//   (target: Object, propertyKey: string): void;
//   (): symbol;
// }
type Interface = PropertyDecorator & { (): symbol };
