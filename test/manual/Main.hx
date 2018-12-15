import controlledrandom.CRandom;

class Main {
    static function main() {
        new Main(4).run();
    }

    var rand: CRandom;
    var lastPick: Int;
    var pickCounts: Array<Int>;

    function new(setSize: Int) {
        rand = CRandom.create(setSize);
        pickCounts = [for (i in 0...setSize) 0];
    }

    function run() {
        for (i in 0...100) {
            Sys.sleep(0.05);

            logPick(rand.next());
            printStats();
        }
    }

    function logPick(pick: Int) {
        lastPick = pick;
        pickCounts[pick] += 1;
    }

    function printStats() {
        trace("");
        trace("");
        trace("");

        trace("pick: " + lastPick);

        trace("pick counts:");
        for (i in 0...pickCounts.length) {
            trace("\t" + i + ": " + pickCounts[i]);
        }

        trace("pick deltas:");
        var minCount = pickCounts[0];
        for (pickCount in pickCounts) {
            minCount = Std.int(Math.min(minCount, pickCount));
        }
        for (i in 0...pickCounts.length) {
            trace("\t" + i + ": " + (pickCounts[i] - minCount));
        }

    }
}
