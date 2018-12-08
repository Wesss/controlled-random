package controlledrandom;

typedef CRandomState = {pickDelta: Map<Int, Int>, randomFn: Void->Int};

class CRandomFns {
    public static function _new(max: Int, randomFn: Int->Int): CRandomState {
        var pickDelta = new Map<Int, Int>();
        for (i in 0...max) {
            pickDelta.set(i, 0);
        }
        var curriedRandomFn = function() return randomFn(max);

        return {pickDelta: pickDelta, randomFn: curriedRandomFn};
    }

    private static function next(pickDelta, randomFn: Void->Int) {
        return 0;
    }
}
