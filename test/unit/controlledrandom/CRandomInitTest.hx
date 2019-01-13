package controlledrandom;

import haxe.ds.Vector;
import controlledrandom.CRandomFns;
import controlledrandom.CRandom;

class CRandomInitTest extends haxe.unit.TestCase {

    public function testInitState() {
        var state: CRandomState = CRandomFns._new(2, function(x) return 0);

        for (i in state.pickDelta) {
            assertEquals(0, state.pickDelta[0]);
        }

        assertEquals(0, state.randomFn(99));
    }
}
