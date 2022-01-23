"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const http_exception_1 = require("./http.exception");
const http_status_enum_1 = require("./http-status.enum");
/**
 * Defines an HTTP exception for *Unprocessable Entity* type errors.
 *
 * @see [Base Exceptions](https://docs.nestjs.com/exception-filters#base-exceptions)
 *
 * @publicApi
 */
class UnprocessableEntityException extends http_exception_1.HttpException {
    /**
     * Instantiate an `UnprocessableEntityException` Exception.
     *
     * @example
     * `throw new UnprocessableEntityException()`
     *
     * @usageNotes
     * The constructor arguments define the HTTP response.
     * - The `message` argument defines the JSON response body.
     * - The `error` argument defines the HTTP Status Code.
     *
     * By default, the JSON response body contains two properties:
     * - `statusCode`: defaults to the Http Status Code provided in the `error` argument
     * - `message`: the string `'Unprocessable Entity'` by default; override this by supplying
     * a string in the `message` parameter.
     *
     * To override the entire JSON response body, pass an object.  Nest will serialize
     * the object and return it as the JSON response body.
     *
     * The `error` argument is required, and should be a valid HTTP status code.
     * Best practice is to use the `HttpStatus` enum imported from `nestjs/common`.
     *
     * @param message string or object describing the error condition.
     * @param error HTTP response status code
     */
    constructor(message, error = 'Unprocessable Entity') {
        super(http_exception_1.HttpException.createBody(message, error, http_status_enum_1.HttpStatus.UNPROCESSABLE_ENTITY), http_status_enum_1.HttpStatus.UNPROCESSABLE_ENTITY);
    }
}
exports.UnprocessableEntityException = UnprocessableEntityException;
//# sourceMappingURL=unprocessable-entity.exception.js.map