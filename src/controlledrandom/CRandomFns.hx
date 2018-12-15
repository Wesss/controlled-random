package controlledrandom;

import haxe.ds.Vector;

typedef CRandomState = {pickDelta: Vector<Int>, randomFn: Int->Int};
typedef FnOutput = {state: CRandomState, result: Dynamic};

class CRandomFns {
    public static function _new(max: Int, randomFn: Int->Int): CRandomState {
        var pickDelta = new Vector(max).map(function(_) return 0);
        return {pickDelta: pickDelta, randomFn: randomFn};
    }

    public static function next(state: CRandomState): FnOutput {
        return nextFn(state, pick);
    }

    public static function nextFn(state: CRandomState, pickFn): FnOutput {
        var result = pickFn(state);

        var pickDelta = state.pickDelta.copy();
        pickDelta[result] += 1;
        var minVal = pickDelta[0];
        for (i in 1...state.pickDelta.length) {
            minVal = Std.int(Math.min(minVal, pickDelta[i]));
        }
        if (minVal > 0) {
            pickDelta = pickDelta.map(function(count) return count - 1);
        }

        return {state: {pickDelta: pickDelta, randomFn: state.randomFn}, result: result};
    }

    public static function pick(state: CRandomState): Int {
        return state.randomFn(state.pickDelta.length);
    }
}
