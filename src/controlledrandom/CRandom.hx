package controlledrandom;

class CRandom {
    var randomFn:Void->Int;

    public static function create():CRandom {
        return new CRandom(function() return Std.random(2));
    }

    public function new(randomFn:Void->Int) {
        this.randomFn = randomFn;
    }

    public function next() {
        return randomFn();
    }
}
