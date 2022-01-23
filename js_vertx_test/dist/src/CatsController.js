"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
var __param = (this && this.__param) || function (paramIndex, decorator) {
    return function (target, key) { decorator(target, key, paramIndex); }
};
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
const decorators_1 = require("./decorators");
const web_1 = require("@vertx/web");
const decorators_2 = require("./decorators");
const ICatsController_1 = require("./ICatsController");
let CatsController = class CatsController {
    findAll() {
        return __awaiter(this, void 0, void 0, function* () {
            return [];
        });
    }
    create(body) {
        return __awaiter(this, void 0, void 0, function* () {
            return body;
        });
    }
    update(body, context) {
        return __awaiter(this, void 0, void 0, function* () {
            return body;
        });
    }
};
__decorate([
    decorators_1.Get("/"),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", []),
    __metadata("design:returntype", Promise)
], CatsController.prototype, "findAll", null);
__decorate([
    decorators_1.Post("/"),
    __param(0, decorators_1.Body),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object]),
    __metadata("design:returntype", Promise)
], CatsController.prototype, "create", null);
__decorate([
    decorators_2.Put("/"),
    __param(0, decorators_1.Body),
    __param(1, decorators_1.Context),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object,
        web_1.RoutingContext]),
    __metadata("design:returntype", Promise)
], CatsController.prototype, "update", null);
CatsController = __decorate([
    decorators_2.Implements(ICatsController_1.ICatsController),
    decorators_1.Controller("cats")
], CatsController);
exports.CatsController = CatsController;
// const IsAuthorized = createRouteDecorator((ctx) => {
//   if (ctx.user()) {
//     return null;
//   } else throw new Error();
// });
//# sourceMappingURL=CatsController.js.map