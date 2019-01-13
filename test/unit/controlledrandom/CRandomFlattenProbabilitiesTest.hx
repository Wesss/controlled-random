package controlledrandom;

import haxe.ds.Vector;
import controlledrandom.CRandomFns;
import controlledrandom.CRandom;

class CRandomFlattenProbabilitiesTest extends haxe.unit.TestCase {

    // TODO flattenProbabilities param validating

    public function testFlattenUnitProbs() {
        var probDist = Vector.fromArrayCopy([1, 1, 1]);
        var unitOutcomes: Vector<Int> = CRandomFns.flattenProbabilities(probDist);

        assertEquals(3, unitOutcomes.length);
        assertEquals(0, unitOutcomes[0]);
        assertEquals(1, unitOutcomes[1]);
        assertEquals(2, unitOutcomes[2]);
    }

    public function testFlattenDifferentProbs() {
        var probDist = Vector.fromArrayCopy([2, 1, 3]);
        var unitOutcomes: Vector<Int> = CRandomFns.flattenProbabilities(probDist);

        assertEquals(6, unitOutcomes.length);
        assertEquals(0, unitOutcomes[0]);
        assertEquals(0, unitOutcomes[1]);
        assertEquals(1, unitOutcomes[2]);
        assertEquals(2, unitOutcomes[3]);
        assertEquals(2, unitOutcomes[4]);
        assertEquals(2, unitOutcomes[5]);
    }

    public function testFlattenZeroProbs() {
        var probDist = Vector.fromArrayCopy([1, 0, 1]);
        var unitOutcomes: Vector<Int> = CRandomFns.flattenProbabilities(probDist);

        assertEquals(2, unitOutcomes.length);
        assertEquals(0, unitOutcomes[0]);
        assertEquals(2, unitOutcomes[1]);
    }

    public function testFlattenSingleProb() {
        var probDist = Vector.fromArrayCopy([1]);
        var unitOutcomes: Vector<Int> = CRandomFns.flattenProbabilities(probDist);

        assertEquals(1, unitOutcomes.length);
        assertEquals(0, unitOutcomes[0]);
    }
}
