import controlledrandom.*;

class Runner {
    static function main() {
        var testRunner = new haxe.unit.TestRunner();

        // add new TestCases here
        testRunner.add(new CRandomInitTest());
        testRunner.add(new CRandomNextTest());
        testRunner.add(new CRandomProbDistTest());
        testRunner.add(new CRandomFlattenProbabilitiesTest());

        // exit w/code 1 if tests fail, for CI
        testRunner.run();
        var exitCode = 0;
        if (!testRunner.result.success) {
            exitCode = 1;
        }
        Sys.exit(exitCode);
    }
}
