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
const http_exception_1 = require("./exceptions/http.exception");
const http_status_enum_1 = require("./exceptions/http-status.enum");
const UserDto_1 = require("./UserDto");
const decorators_1 = require("./decorators");
const IUserDao_1 = require("./IUserDao");
let UserService = 
// @Implements(IUserService)
class UserService {
    findAll(user) {
        return __awaiter(this, void 0, void 0, function* () {
            console.log(user);
            const res = this.userDao.findAll().map((model) => new UserDto_1.UserDto(model));
            return res;
        });
    }
    findOne(id) {
        if (id == "666") {
            throw new http_exception_1.HttpException("aaaa 66 demonio diabo", http_status_enum_1.HttpStatus.BAD_REQUEST);
        }
        return new UserDto_1.UserDto(this.userDao.findOne(id));
    }
};
__decorate([
    IUserDao_1.IUserDao,
    __metadata("design:type", Object)
], UserService.prototype, "userDao", void 0);
UserService = __decorate([
    decorators_1.Injectable
    // @Implements(IUserService)
], UserService);
exports.UserService = UserService;
//# sourceMappingURL=UserService.js.map