"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const objectUtils_1 = require("./objectUtils");
function getDecoratorType(args, longType = false) {
    const [target, propertyKey, descriptor] = args;
    const staticType = (type) => {
        if (!longType) {
            return type;
        }
        return target !== objectUtils_1.getClass(target) ? type : (type + ".static");
    };
    if (typeof descriptor === "number") {
        return propertyKey
            ? staticType("parameter")
            : longType
                ? "parameter.constructor"
                : "parameter";
    }
    if ((propertyKey && descriptor === undefined) ||
        (descriptor && (descriptor.get || descriptor.set))) {
        return staticType("property");
    }
    return descriptor && descriptor.value ? staticType("method") : "class";
}
exports.getDecoratorType = getDecoratorType;
/**
 *
 */
class UnsupportedDecoratorType extends Error {
    constructor(decorator, args) {
        super(UnsupportedDecoratorType.buildMessage(decorator, args));
    }
    static buildMessage(decorator, args) {
        const [target, propertyKey, index] = args;
        const bindingType = getDecoratorType(args, true);
        const shortBinding = bindingType.split("/")[0];
        const param = shortBinding === "parameter" ? ".[" + index + "]" : "";
        const cstr = shortBinding === "parameter" ? ".constructor" : "";
        const method = propertyKey ? "." + propertyKey : cstr;
        const path = objectUtils_1.nameOf(objectUtils_1.getClass(target)) + method + param;
        return `${decorator.name} cannot used as ${bindingType} decorator on ${path}`;
    }
}
exports.UnsupportedDecoratorType = UnsupportedDecoratorType;
/**
 *
 * @param target
 * @param {string} propertyKey
 * @returns {DecoratorParameters}
 */
function decoratorArgs(target, propertyKey) {
    return [target, propertyKey, objectUtils_1.descriptorOf(target, propertyKey)];
}
exports.decoratorArgs = decoratorArgs;
function decorateMethodsOf(klass, decorator) {
    objectUtils_1.methodsOf(klass).forEach(({ target, propertyKey }) => {
        if (target !== objectUtils_1.classOf(klass)) {
            Object.defineProperty(objectUtils_1.prototypeOf(klass), propertyKey, {
                value(...args) {
                    return objectUtils_1.prototypeOf(target)[propertyKey].apply(this, args);
                },
            });
        }
        decorator(objectUtils_1.prototypeOf(klass), propertyKey, objectUtils_1.descriptorOf(klass, propertyKey));
    });
}
exports.decorateMethodsOf = decorateMethodsOf;
// export function applyDecorators(...decorators: (any | ClassDecorator | MethodDecorator | PropertyDescriptor | ParameterDecorator)[]): any {
//   return (...args: DecoratorParameters) => {
//     decorators
//       .filter((o: any) => !!o)
//       .forEach((decorator: Function) => {
//         decorator(...args);
//       });
//   };
// }
function applyClassDecorators(...decorators) {
    return (target) => {
        decorators.forEach((decorator) => {
            decorator(target);
        });
    };
}
exports.applyClassDecorators = applyClassDecorators;
//# sourceMappingURL=decoratorUtilts.js.map