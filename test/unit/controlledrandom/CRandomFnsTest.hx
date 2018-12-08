package controlledrandom;

import haxe.ds.Vector;
import controlledrandom.CRandomFns;
import controlledrandom.CRandom;

class CRandomFnsTest extends haxe.unit.TestCase {

    public function testInitState() {
        var state: CRandomState = CRandomFns._new(2, function(x) return 0);

        for (i in state.pickDelta) {
            assertEquals(0, state.pickDelta[0]);
        }

        assertEquals(0, state.randomFn(99));
    }

    public function testNext() {
        var state: CRandomState = {
            pickDelta: new Vector(3).map(function(_) return 0),
            randomFn: function(x) return 0
        };
        var output: FnOutput = CRandomFns.next(state);

        assertEquals(0, output.result);
    }
}
