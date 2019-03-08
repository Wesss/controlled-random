# Controlled Random

People are inherently bad at reasoning about randomness, so don’t leave your user’s experience to chance. Give users what they expect out of randomness.

Controlled Random is a stateful random number generator wrapper that modifies its output based on its previous output. Each possible value's chance to be picked is increased based on how under-served its been compared to the most picked value. This fulfills the [Monte Carlo fallacy](https://en.wikipedia.org/wiki/Gambler%27s_fallacy) by ensuring that each value is picked an even amount in the long run.

## Usage

### Haxelib

1. Install the haxelib with the following:
```
haxelib install controlled-random:x.y.z
```

2. Add the following line to your .hxml file:
```
-lib controlled-random:x.y.z
```

3. Use with something along the lines of:
```
import controlledrandom.CRandom;
...
var cRand: CRandom = CRandom.create(100);
for (i in 0...100) {
    trace(cRand.next());
}
```

<aside class="warning">
NOTE: Generating each random number runs in O(n), where n is the number of possible values to pick from. Take caution to keep your group sizes as contained as possible.
</aside>

<aside class="warning">
NOTE: This should not be used in projects requiring true random chance, such as encryption or gambling. We are not responsible for the misuse of this library.
</aside>

## Contributing

This section is under construction.

### First Time Setup
- download and install haxe and haxelib 3.4.4
- export $PROJECT_ROOT to be this repository's root directory
- Install python3 (TODO add more detail, including exact version)

### Unit/Integration Tests
Interpreting tests:
```bash
haxe interpret-unit-tests.hxml
```
```bash
haxe interpret-integration-tests.hxml
```
Compiling and running tests:
```bash
haxe compile-unit-tests.hxml
# TODO then run neko build
# TODO then run python build
```
```bash
haxe compile-integration-tests.hxml
# TODO then run neko build
# TODO then run python build
```

### E2E Tests

Haxelib test:
```bash
cd $PROJECT_ROOT/test/e2e/haxelib/
haxelib dev controlled-random $PROJECT_ROOT
haxe haxelib-test.hxml
```
