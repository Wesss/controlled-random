# Controlled Random

People are inherently bad at reasoning about randomness. So don’t leave your user’s experience to chance; Give users what they expect out of randomness.

Controlled Random is a stateful random number generator wrapper that modifies its output based on its previous output.


## Usage

TODO note on O(n) runtime on group size

## Contributing

### First Time Setup
- download/install haxe/haxelib, set to version 3.4.4
- export $PROJECT_ROOT to be this repository's root directory

### Unit/Integration Tests
```bash
haxe interpret-unit-tests.hxml
```
```bash
haxe interpret-integration-tests.hxml
```
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

```bash
# haxelib test
cd $PROJECT_ROOT/test/e2e/haxelib/
haxelib dev controlled-random $PROJECT_ROOT
haxe haxelib-test.hxml
```
