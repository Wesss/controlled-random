package controlledrandom;

import haxe.ds.Vector;
using util.VectorExtender;

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

    public static function nextFn(state: CRandomState, pickFn: CRandomState->Int): FnOutput {
        var result = pickFn(state);

        var pickDelta = state.pickDelta.copy();
        pickDelta[result] += 1;

        if (pickDelta.min() > 0) {
            pickDelta = pickDelta.map(function(count) return count - 1);
        }

        return {state: {pickDelta: pickDelta, randomFn: state.randomFn}, result: result};
    }

    public static function pick(state: CRandomState): Int {
        return pickFn(state, getPreferNotMostPickedProbDist);
    }

    public static function pickFn(state: CRandomState, probDistFn: Vector<Int>->Vector<Int>): Int {
        // get pick probabilities
        var probDist: Vector<Int> = probDistFn(state.pickDelta);

        // pick a value randomly
        var unitProbabilities: Vector<Int> = flattenProbabilities(probDist);
        return unitProbabilities[state.randomFn(unitProbabilities.length)];
    }

    /**
     *  @return Vector<Int> representing a probability distribution,
     *      where for i in 0 ... result.length - 1, the chance of picking i is result[i]/sum(result.values)
     */
    public static function getPreferNotMostPickedProbDist(pickDelta: Vector<Int>): Vector<Int> {
        var probDist = new Vector(pickDelta.length);
        var max = pickDelta.max();
        for (i in 0...probDist.length) {
            if (max == 0) {
                probDist[i] = 1;
            } else {
                probDist[i] = pickDelta[i] == 0 ? 2 : 1;
            }
        }
        return probDist;
    }

    public static function flattenProbabilities(probDist: Vector<Int>): Vector<Int> {
        return probDist;
    }
}
