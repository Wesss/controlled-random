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

    public function testNext() {
        var state: CRandomState = {
            pickDelta: [0 => 0, 1 => 0, 2 => 0],
            randomFn: function() return 0
        };
        var output: FnOutput = CRandomFns.next(state);

        assertEquals(0, output.result);
    }
}
