"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const shared_utils_1 = require("../utils/shared.utils");
/**
 * Defines the base Nest HTTP exception, which is handled by the default
 * Exceptions Handler.
 *
 * @see [Base Exceptions](https://docs.nestjs.com/exception-filters#base-exceptions)
 *
 * @publicApi
 */
class HttpException extends Error {
    /**
     * Instantiate a plain HTTP Exception.
     *
     * @example
     * `throw new HttpException()`
     *
     * @usageNotes
     * The constructor arguments define the HTTP response.
     * - The `response` argument (required) defines the JSON response body.
     * - The `status` argument (required) defines the HTTP Status Code.
     *
     * By default, the JSON response body contains two properties:
     * - `statusCode`: defaults to the Http Status Code provided in the `error` argument
     * - `message`: a short description of the HTTP error by default; override this
     * by supplying a string in the `response` parameter.
     *
     * To override the entire JSON response body, pass an object.  Nest will serialize
     * the object and return it as the JSON response body.
     *
     * The `status` argument is required, and should be a valid HTTP status code.
     * Best practice is to use the `HttpStatus` enum imported from `nestjs/common`.
     *
     * @param response string or object describing the error condition.
     * @param status HTTP response status code
     */
    constructor(response, status) {
        super();
        this.response = response;
        this.status = status;
        this.message = response;
    }
    getResponse() {
        return this.response;
    }
    getStatus() {
        return this.status;
    }
    toString() {
        const message = this.getErrorString(this.message);
        return `Error: ${message}`;
    }
    getErrorString(target) {
        return shared_utils_1.isString(target) ? target : JSON.stringify(target);
    }
    static createBody(message, error, statusCode) {
        if (!message) {
            return { statusCode, error };
        }
        return shared_utils_1.isObject(message) && !Array.isArray(message)
            ? message
            : { statusCode, error, message };
    }
}
exports.HttpException = HttpException;
//# sourceMappingURL=http.exception.js.map