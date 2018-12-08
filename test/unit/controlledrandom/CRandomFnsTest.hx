package controlledrandom;

import controlledrandom.CRandomFns;

class CRandomFnsTest extends haxe.unit.TestCase {

    public function testInitState() {
        var state: CRandomState = CRandomFns._new(2, function(x) return 0);

        assertTrue(state.pickDelta.exists(0));
        assertEquals(0, state.pickDelta.get(0));
        assertTrue(state.pickDelta.exists(1));
        assertEquals(0, state.pickDelta.get(1));

        assertEquals(0, state.randomFn());
    }
}
