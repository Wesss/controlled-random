package controlledrandom;

import controlledrandom.CRandom;

class CRandomTest extends haxe.unit.TestCase {
    var cRandom:CRandom;

	override public function setup() {
		this.cRandom = new CRandom(function() return 0);
	}

	public function testNextReturnsFunctionOutput() {
		assertEquals(0, cRandom.next());
	}
}
