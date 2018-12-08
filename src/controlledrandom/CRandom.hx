package controlledrandom;

class CRandom {
    var pickDelta: Map<Int, Int>;
    var randomFn: Void->Int;

    public static function create(max: Int): CRandom {
        return new CRandom(max, Std.random);
    }

    private function new(max: Int, randomFn: Int->Int) {
        CRandomFns._new(max, randomFn);
    }

    public function next() {
        return CRandomFns._next(pickDelta, randomFn);
    }
}
