import controlledrandom.CRandom;

class Main {
    static function main():Void {
        var cRand: CRandom = CRandom.create(10);
        for (i in 0...100) {
            trace(cRand.next());
        }
    }
}
