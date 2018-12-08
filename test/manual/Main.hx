import controlledrandom.CRandom;

class Main {
    static function main() {
        var rand: CRandom = CRandom.create(100);

        for (i in 0...40) {
            Sys.sleep(0.05);
            trace(rand.next());
        }
    }
}
