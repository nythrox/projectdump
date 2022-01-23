"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
class DomainConverter {
    static fromDto(domain, dto) {
        const instance = Object.create(domain.prototype);
        instance.state = dto;
        return instance;
    }
    static toDto(domain) {
        return domain.state;
    }
}
exports.DomainConverter = DomainConverter;
//# sourceMappingURL=domain.js.map