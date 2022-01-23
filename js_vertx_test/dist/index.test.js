"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const unit_1 = require("@vertx/unit");
const suite = unit_1.TestSuite.create("the_test_suite");
suite.test("my_test_case", (should) => {
    let s = "value";
    should.assertEquals("value", s);
});
suite.run();
//# sourceMappingURL=index.test.js.map