package controlledrandom;

import controlledrandom.CRandom;

class CRandomTest extends haxe.unit.TestCase {
    private var randVal:Float;

    // for use as a deterministic pseudo-RNG
    private function pseudoRandomSeededInt(max: Int): Int {
        randVal = (randVal * 4091 + 49251) % 233281;
        if (randVal < 0) {
            randVal *= -1;
        }

        return Std.int((randVal / 233281.0) * max);
    }

    public function testNumbersStayInBounds() {
        // but it fits our needs as a seeded RNG for some basic tests
        randVal = 0.0;

        var cRand: CRandom = CRandom.createWithRandom(100, pseudoRandomSeededInt);

        for (i in 0...10000) {
            var randValue = cRand.next();
            trace(randValue);
            assertTrue(randValue < 100);
            assertTrue(randValue > -1);
        }
    }
}
