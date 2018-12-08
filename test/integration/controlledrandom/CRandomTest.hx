package controlledrandom;

import controlledrandom.CRandom;

class CRandomTest extends haxe.unit.TestCase {

    public function testNumbersStayInBounds() {
        var max = 100;
        var rand: CRandom = CRandom.create(100);

        for (i in 0...1000) {
            assertTrue(rand.next() < 100);
            assertTrue(rand.next() > -1);
        }
    }
}
