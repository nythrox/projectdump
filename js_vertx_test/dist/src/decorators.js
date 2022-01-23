"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const enums_1 = require("@vertx/core/enums");
const conquer_1 = require("./conquer");
const unauthorized_exception_1 = require("./exceptions/unauthorized.exception");
const inversify_1 = require("inversify");
function Request(url, method = enums_1.HttpMethod.GET) {
    const decorator = function (target, propertyKey, descriptor) {
        var _a, _b;
        let finalUrl;
        if (url) {
            finalUrl = url === "/" ? "" : url.startsWith("/") ? url : "/" + url;
        }
        else {
            finalUrl = "/" + propertyKey;
        }
        const parameters = ((_a = Reflect.getMetadata("design:paramtypes", target, propertyKey)) !== null && _a !== void 0 ? _a : []).map((param) => ({
            type: param,
        }));
        const routes = (_b = Reflect.getMetadata(CONTROLLER_METADATA.routes, target)) !== null && _b !== void 0 ? _b : [];
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
function Get(url) {
    return Request(url, enums_1.HttpMethod.GET);
}
exports.Get = Get;
function Post(url) {
    return Request(url, enums_1.HttpMethod.POST);
}
exports.Post = Post;
function Connect(url) {
    return Request(url, enums_1.HttpMethod.CONNECT);
}
exports.Connect = Connect;
function Delete(url) {
    return Request(url, enums_1.HttpMethod.DELETE);
}
exports.Delete = Delete;
function Head(url) {
    return Request(url, enums_1.HttpMethod.HEAD);
}
exports.Head = Head;
function Options(url) {
    return Request(url, enums_1.HttpMethod.OPTIONS);
}
exports.Options = Options;
function Other(url) {
    return Request(url, enums_1.HttpMethod.OTHER);
}
exports.Other = Other;
function Patch(url) {
    return Request(url, enums_1.HttpMethod.PATCH);
}
exports.Patch = Patch;
function Put(url) {
    return Request(url, enums_1.HttpMethod.PUT);
}
exports.Put = Put;
function Trace(url) {
    return Request(url, enums_1.HttpMethod.TRACE);
}
exports.Trace = Trace;
// const h = Injector.resolve(UserController);
// console.log("h:", h);
var CONTROLLER_METADATA;
(function (CONTROLLER_METADATA) {
    CONTROLLER_METADATA["baseUrl"] = "conquer:controller.baseUrl";
    CONTROLLER_METADATA["routes"] = "conquer:controller.routes";
    CONTROLLER_METADATA["middleware"] = "conquer:controller.midleware";
})(CONTROLLER_METADATA = exports.CONTROLLER_METADATA || (exports.CONTROLLER_METADATA = {}));
var PARAM_METADATA;
(function (PARAM_METADATA) {
    PARAM_METADATA["pipes"] = "conquer:param.pipes";
})(PARAM_METADATA = exports.PARAM_METADATA || (exports.PARAM_METADATA = {}));
var ROUTE_METADATA;
(function (ROUTE_METADATA) {
    ROUTE_METADATA["middleware"] = "conquer:param.middleware";
})(ROUTE_METADATA = exports.ROUTE_METADATA || (exports.ROUTE_METADATA = {}));
function Controller(baseUrl) {
    return (target) => {
        inversify_1.injectable()(target);
        Reflect.metadata(CONTROLLER_METADATA.baseUrl, baseUrl !== null && baseUrl !== void 0 ? baseUrl : target.name.replace(new RegExp("Controller\\w*"), "").toLowerCase())(target.prototype);
    };
}
exports.Controller = Controller;
function createClassDecorator(f) {
    return (target) => {
        var _a;
        const middleware = (_a = Reflect.getMetadata(CONTROLLER_METADATA.middleware, target)) !== null && _a !== void 0 ? _a : [];
        middleware.push(f);
        Reflect.defineMetadata(CONTROLLER_METADATA.middleware, middleware, target.prototype);
        return target;
    };
}
exports.createClassDecorator = createClassDecorator;
function createParamDecorator(f) {
    return (target, propertyKey, parameterIndex) => {
        var _a;
        const params = (_a = Reflect.getMetadata(PARAM_METADATA.pipes, target, propertyKey)) !== null && _a !== void 0 ? _a : [];
        params[parameterIndex] = f;
        Reflect.defineMetadata(PARAM_METADATA.pipes, params, target, propertyKey);
        // console.log(target[propertyKey].name, 'index: ', parameterIndex,'value:',f, 'total: ', Reflect.getMetadata(PARAM_METADATA.pipes, target, propertyKey) )
    };
}
exports.createParamDecorator = createParamDecorator;
function createRouteDecorator(f) {
    return function (target, propertyKey, descriptor) {
        var _a;
        const middleware = (_a = Reflect.getMetadata(ROUTE_METADATA.middleware, target, propertyKey)) !== null && _a !== void 0 ? _a : [];
        middleware.push(f);
        Reflect.defineMetadata(ROUTE_METADATA.middleware, middleware, target, propertyKey);
        return descriptor;
    };
}
exports.createRouteDecorator = createRouteDecorator;
function Authenticated(arg1, arg2, arg3) {
    const hasUser = (ctx) => {
        const user = ctx.user();
        if (!user) {
            throw new unauthorized_exception_1.UnauthorizedException();
        }
    };
    if (arg2 && arg3) {
        return createRouteDecorator(hasUser)(arg1, arg2, arg3);
    }
    return createClassDecorator(hasUser)(arg1);
}
exports.Authenticated = Authenticated;
// export const Authenticated = createRouteDecorator((ctx) => {
//   const user = ctx.user();
//   if (!user) {
//     throw new UnauthorizedException();
//   }
// });
exports.Body = createParamDecorator((ctx) => {
    return ctx.getBodyAsJson();
});
exports.User = createParamDecorator((ctx) => {
    return ctx.user();
});
exports.Context = createParamDecorator((ctx) => {
    return ctx;
});
exports.Req = createParamDecorator((ctx) => {
    return ctx.request();
});
exports.Res = createParamDecorator((ctx) => {
    return ctx.response();
});
exports.Param = (name) => {
    return createParamDecorator((ctx) => {
        return ctx.request().getParam(name);
    });
};
class Paramtype {
}
function Injectable(target) {
    inversify_1.injectable()(target);
    return target;
}
exports.Injectable = Injectable;
function Inject(arg1, propertyKey) {
    if (propertyKey) {
        return _Inject;
    }
    if (isInterface(arg1)) {
        return inversify_1.inject(arg1());
    }
    return inversify_1.inject(arg1);
}
exports.Inject = Inject;
function isInterface(obj) {
    return obj.name === "_interface";
}
function _Inject(target, propertyKey) {
    const type = Reflect.getMetadata("design:type", target, propertyKey);
    inversify_1.inject(type)(target, propertyKey);
}
exports._Inject = _Inject;
function createInterface(name) {
    const symbol = Symbol.for(name);
    function _interface(target, propertyKey) {
        if (target && propertyKey) {
            console.log(`
          CLASS ${target.constructor.name} IS
          SEARCHING FOR ${symbol.toString()}
          `);
            inversify_1.inject(symbol)(target, propertyKey);
        }
        else {
            return symbol;
        }
    }
    return _interface;
}
exports.createInterface = createInterface;
function Class(c) {
    const Class = c;
    console.log("gopnan do something" + c.name);
    Class.Implements = function (...interfaces) {
        interfaces.forEach((i) => {
            conquer_1.inversify.bind(i()).to(Class);
        });
        return Class;
    };
    Class.Extends = function (...classes) {
        classes.forEach((i) => {
            conquer_1.inversify.bind(i).to(Class);
        });
        return Class;
    };
    return Class;
}
exports.Class = Class;
function Implements(...interfaces) {
    return (target) => {
        console.log(`
    REGISTERING ${target.name}
    TO ${interfaces.map((i) => i().toString()).join(" ")}
    `);
        interfaces.forEach((i) => {
            conquer_1.inversify.bind(i()).to(target);
        });
    };
}
exports.Implements = Implements;
function Extends(...classes) {
    return (target) => {
        console.log(`
    REGISTERING ${target.name}
    TO ${classes.map((i) => i.toString()).join(" ")}
    `);
        classes.forEach((i) => {
            conquer_1.inversify.bind(i).to(target);
        });
    };
}
exports.Extends = Extends;
//# sourceMappingURL=decorators.js.map