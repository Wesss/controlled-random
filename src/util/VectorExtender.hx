package util;

import haxe.ds.Vector;

class VectorExtender {

    static public function min(vector: Vector<Int>): Int {
        var min = vector[0];
        for (i in 1...vector.length) {
            min = Std.int(Math.min(min, vector[i]));
        }
        return min;
    }

    static public function max(vector: Vector<Int>): Int {
        var max = vector[0];
        for (i in 1...vector.length) {
            max = Std.int(Math.max(max, vector[i]));
        }
        return max;
    }
}
