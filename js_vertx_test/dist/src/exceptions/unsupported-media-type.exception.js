"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const http_exception_1 = require("./http.exception");
const http_status_enum_1 = require("./http-status.enum");
/**
 * Defines an HTTP exception for *Unsupported Media Type* type errors.
 *
 * @see [Base Exceptions](https://docs.nestjs.com/exception-filters#base-exceptions)
 *
 * @publicApi
 */
class UnsupportedMediaTypeException extends http_exception_1.HttpException {
    /**
     * Instantiate an `UnsupportedMediaTypeException` Exception.
     *
     * @example
     * `throw new UnsupportedMediaTypeException()`
     *
     * @usageNotes
     * The constructor arguments define the HTTP response.
     * - The `message` argument defines the JSON response body.
     * - The `error` argument defines the HTTP Status Code.
     *
     * By default, the JSON response body contains two properties:
     * - `statusCode`: defaults to the Http Status Code provided in the `error` argument
     * - `message`: the string `'Unsupported Media Type'` by default; override this by supplying
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
    constructor(message, error = 'Unsupported Media Type') {
        super(http_exception_1.HttpException.createBody(message, error, http_status_enum_1.HttpStatus.UNSUPPORTED_MEDIA_TYPE), http_status_enum_1.HttpStatus.UNSUPPORTED_MEDIA_TYPE);
    }
}
exports.UnsupportedMediaTypeException = UnsupportedMediaTypeException;
//# sourceMappingURL=unsupported-media-type.exception.js.map