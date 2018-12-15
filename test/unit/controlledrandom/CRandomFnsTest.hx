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

    public function testNextPicksNumber() {
        var stateParam;
        var pickFn = function(state) {
            trace(state);
            stateParam = state;
            return 0;
        };
        var state: CRandomState = {
            pickDelta: new Vector(3).map(function(_) return 0),
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
        var pickDelta = new Vector(3);
        pickDelta[0] = 0;
        pickDelta[1] = 3;
        pickDelta[2] = 4;

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
        var pickDelta = new Vector(3);
        pickDelta[0] = 3;
        pickDelta[1] = 3;
        pickDelta[2] = 0;

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
