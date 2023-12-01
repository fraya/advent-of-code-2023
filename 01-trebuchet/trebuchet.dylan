Module: trebuchet-impl

define method read-lines
    (stream :: <stream>) => (lines :: <sequence>)
  split(read-to-end(stream), "\n")
end;

define method read-lines
    (string :: <string>) => (lines :: <sequence>)
  let stream = make(<string-stream>, contents: string, direction: #"input");
  read-lines(stream)
end;

define function calibration
    (sequence :: <sequence>) => (calibration :: <integer>)
  let digits = choose(decimal-digit?, sequence);
  if (digits.size = 0)
    0;
  else
    let calibration-digits = vector(first(digits), last(digits));
    string-to-integer(map-as(<string>, identity, calibration-digits))
  end;
end;
