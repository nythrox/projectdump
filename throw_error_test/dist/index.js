/// <reference types="es4x" />
// @ts-check
// your code goes here...
vertx
    .createHttpServer()
    .requestHandler(function (req) {
    req.response()
        .putHeader("content-type", "text/plain")
        .end("Hello!");
}).listen(8080);
console.log('Listening at http://127.0.0.1:8080');
//# sourceMappingURL=index.js.map