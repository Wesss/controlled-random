package controlledrandom;

import haxe.ds.Vector;
import controlledrandom.CRandomFns;
import controlledrandom.CRandom;

class CRandomProbDistTest extends haxe.unit.TestCase {

    public function testpreferNotMostPickedEqualProbs() {
        var pickDelta = Vector.fromArrayCopy([0, 0, 0]);
        var probDist: Vector<Int> = CRandomFns.getPreferNotMostPickedProbDist(pickDelta);

        assertEquals(3, probDist.length);
        assertEquals(1, probDist[0]);
        assertEquals(1, probDist[1]);
        assertEquals(1, probDist[2]);
    }

    public function testpreferNotMostPickedInequalProbs() {
        var pickDelta = Vector.fromArrayCopy([1, 0, 0]);
        var probDist: Vector<Int> = CRandomFns.getPreferNotMostPickedProbDist(pickDelta);

        assertEquals(3, probDist.length);
        assertEquals(1, probDist[0]);
        assertEquals(2, probDist[1]);
        assertEquals(2, probDist[2]);
    }
}
