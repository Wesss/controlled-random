package controlledrandom;

import controlledrandom.CRandom;

typedef FnOutput = {state: CRandomState, result: Dynamic};

class CRandomFns {
    public static function _new(max: Int, randomFn: Int->Int): CRandomState {
        var pickDelta = new Map<Int, Int>();
        for (i in 0...max) {
            pickDelta.set(i, 0);
        }
        var curriedRandomFn = function() return randomFn(max);

        return {pickDelta: pickDelta, randomFn: curriedRandomFn};
    }

    public static function next(state: CRandomState) {
        return {state: state, result: state.randomFn()};
    }
}
