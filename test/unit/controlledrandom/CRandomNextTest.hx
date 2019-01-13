package controlledrandom;

import haxe.ds.Vector;
import controlledrandom.CRandomFns;
import controlledrandom.CRandom;

class CRandomNextTest extends haxe.unit.TestCase {

    public function testNextPicksNumber() {
        var stateParam;
        var pickFn = function(state) {
            stateParam = state;
            return 0;
        };
        var state: CRandomState = {
            pickDelta: Vector.fromArrayCopy([0, 0 ,0]),
            randomFn: function(_) return 0
        };

        var output: FnOutput = CRandomFns.nextFn(state, pickFn);

        // assert output
        assertEquals(0, output.result);
        assertEquals(1, output.state.pickDelta[0]);
        assertEquals(0, output.state.pickDelta[1]);
        assertEquals(0, output.state.pickDelta[2]);

        // verify fn calls
        assertEquals(state, stateParam);
    }

    public function testNextPicksLeastPickedNumber() {
        var stateParam;
        var pickFn = function(state) {
            stateParam = state;
            return 0;
        };
        var pickDelta = Vector.fromArrayCopy([0, 3 ,4]);

        var state: CRandomState = {
            pickDelta: pickDelta,
            randomFn: function(_) return 0
        };

        var output: FnOutput = CRandomFns.nextFn(state, pickFn);

        // assert output
        assertEquals(0, output.result);
        assertEquals(0, output.state.pickDelta[0]);
        assertEquals(2, output.state.pickDelta[1]);
        assertEquals(3, output.state.pickDelta[2]);

        // verify fn calls
        assertEquals(state, stateParam);
    }

    public function testNextPicksNotLeastPickedNumber() {
        var stateParam;
        var pickFn = function(state) {
            stateParam = state;
            return 0;
        };
        var pickDelta = Vector.fromArrayCopy([3, 3 ,0]);

        var state: CRandomState = {
            pickDelta: pickDelta,
            randomFn: function(_) return 0
        };

        var output: FnOutput = CRandomFns.nextFn(state, pickFn);

        // assert output
        assertEquals(0, output.result);
        assertEquals(4, output.state.pickDelta[0]);
        assertEquals(3, output.state.pickDelta[1]);
        assertEquals(0, output.state.pickDelta[2]);

        // verify fn calls
        assertEquals(state, stateParam);
    }
}
