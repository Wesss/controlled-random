import controlledrandom.CRandom;

class Main {
    // TODO get this run in circleci
    // TODO exit 1 if failed, use seeded psuedo-random numbers
    static function main():Void {
        var cRand: CRandom = CRandom.create(10);
        for (i in 0...100) {
            trace(cRand.next());
        }
    }
}
