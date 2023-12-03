Module: spelled-test-suite

define test test-calibration ()
  assert-equal(29, calibration("two1nine"));
  assert-equal(83, calibration("eightwothree"));
  assert-equal(13, calibration("abcone2threexyz"));
  assert-equal(24, calibration("xtwone3four"));
  assert-equal(42, calibration("4nineeightseven2"));
  assert-equal(76, calibration("7pqrstsixteen"));
end test;


// Use `_build/bin/spelled-test-suite --help` to see options.
run-test-application()
