Module: trebuchet-test-suite

define constant $text
  = "1abc2\npqr3stu8vwx\na1b2c3d4e5f\ntreb7uchet";

define test test-read-lines ()
  let lines  = read-lines($text);
  
  assert-equal(4, lines.size);
  assert-equal("1abc2", lines[0]);
  assert-equal("pqr3stu8vwx", lines[1]);
  assert-equal("a1b2c3d4e5f", lines[2]);
  assert-equal("treb7uchet", lines[3]);
end test;

define test test-calibration()
  let lines = read-lines($text);

  assert-equal(12, calibration(lines[0]));
  assert-equal(38, calibration(lines[1]));
  assert-equal(15, calibration(lines[2]));
  assert-equal(77, calibration(lines[3]));
end test;

// Use `_build/bin/trebuchet-test-suite --help` to see options.
run-test-application()
