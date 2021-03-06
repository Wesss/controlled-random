import controlledrandom.CRandom;

class Main {
    private static var randVal:Float;

    // for use as a deterministic pseudo-RNG
    private static function pseudoRandomSeededInt(max: Int): Int {
        randVal = (randVal * 4139 + 46957) % 240853;
        if (randVal < 0) {
            randVal *= -1;
        }

        return Std.int((randVal / 240853.0) * max);
    }

    static function main():Void {
        randVal = 0.0;
        var cRand: CRandom = CRandom.createWithRandom(5000, pseudoRandomSeededInt);
        for (i in 0...20000) {
            var randVal = cRand.next();
            trace(randVal);
            if (randVal < 0 || randVal > 4999) {
                trace("got back value " + randVal + " from .next(), iteration " + i);
                Sys.exit(1);
            }
        }
        Sys.exit(0);
    }
}
