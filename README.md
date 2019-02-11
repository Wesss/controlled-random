## Contributing

### First Time Setup
- download/install haxe/haxelib, set to version 3.4.4
TODO export $PROJECT_ROOT for other commands

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
cd $PROJECT_ROOT/test/e2e/haxelib/
haxelib dev controlled-random $PROJECT_ROOT
haxe haxelib-test.hxml
# then run neko build
# then run python build
```
