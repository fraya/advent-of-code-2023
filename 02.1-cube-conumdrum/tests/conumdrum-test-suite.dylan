Module: conumdrum-test-suite

define test test-$greeting ()
  assert-equal("Hello world!", $greeting);
end test;

define test test-greeting ()
  assert-equal("Hello world!", greeting());
end test;

// Use `_build/bin/conumdrum-test-suite --help` to see options.
run-test-application()
