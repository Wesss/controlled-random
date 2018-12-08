package controlledrandom;

import haxe.ds.Vector;

typedef CRandomState = {pickDelta: Vector<Int>, randomFn: Int->Int};
typedef FnOutput = {state: CRandomState, result: Dynamic};

class CRandomFns {
    public static function _new(max: Int, randomFn: Int->Int): CRandomState {
        var pickDelta = new Vector(max).map(function(_) return 0);
        return {pickDelta: pickDelta, randomFn: randomFn};
    }

    public static function next(state: CRandomState) {
        var result = state.randomFn(state.pickDelta.length);
        // TODO modify pick deltas
        return {state: state, result: result};
    }
}
