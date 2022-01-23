"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var unit_1 = require("@vertx/unit");
var suite = unit_1.TestSuite.create("the_test_suite");
suite.test("my_test_case", function (should) {
    var s = "value";
    should.assertEquals("value", s);
});
suite.run();
//# sourceMappingURL=index.test.js.map