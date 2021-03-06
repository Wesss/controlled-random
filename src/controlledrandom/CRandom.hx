package controlledrandom;

import controlledrandom.CRandomFns;

class CRandom {
    var state: CRandomState;

    public static function create(max: Int): CRandom {
        return new CRandom(max, Std.random);
    }

    public static function createWithRandom(max: Int, randomFn: Int->Int): CRandom {
        return new CRandom(max, randomFn);
    }

    private function new(max: Int, randomFn: Int->Int) {
        state = CRandomFns._new(max, randomFn);
    }

    public function next() {
        var output = CRandomFns.next(state);
        state = output.state;
        return output.result;
    }
}
