import js.node.http.Method;
import utest.Assert;
import utest.ui.Report;
import utest.Runner;

import restx.*;

class TestAll {
  static var port = 8888;
  public static function main() {
    // run server
    runServer(function(router) {
      var runner = new Runner();
      // run static tests
      runner.addCase(new TestAll());

      // run REST tests
      runner.addCase(new TestCalls(port, router));

      // report
      Report.create(runner);
      runner.run();
    });

  }

  static function runServer(callback : Router -> Void) {
    var app = new App(port);
    // start server
    app.start(function() callback(app.router));
  }

  public function new() {}

}
