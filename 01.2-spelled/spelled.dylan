Module: spelled-impl

define method read-lines
    (stream :: <stream>)
 => (lines :: <sequence>)
  let lines = make(<deque>);
  for (line = read-line(stream, on-end-of-stream: #f)
	 then read-line(stream, on-end-of-stream: #f),
       while: line)
    add!(lines, line)
  finally
    lines
  end;
end;

define method read-lines
    (string :: <string>) => (lines :: <sequence>)
  let stream = make(<string-stream>, contents: string, direction: #"input");
  read-lines(stream)
end;

define function dictionary
    (keys :: <sequence>, values :: <sequence>)
 => (table :: <table>)
  let table = make(<case-insensitive-string-table>);
  for (key in keys, value in values)
    table[key] := value
  finally
    table
  end for;
end;

define constant $numbers
  = map(integer-to-string, range(from: 1, to: 9));

define constant $words
  = #["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"];

define constant $words-dictionary
  = dictionary($words, $numbers);

define constant $reversed-words-dictionary
  = dictionary(map(reverse, $words), $numbers);

define constant $numbers-dictionary
  = dictionary($numbers, $numbers);

define constant $forward-dictionaries
  = list($numbers-dictionary, $words-dictionary);

define constant $reversed-dictionaries
  = list($numbers-dictionary, $reversed-words-dictionary);

define function find-number
    (dictionaries :: <sequence>, string :: <string>)
 => (number :: false-or(<string>))
  block(return)
    if (string.empty?) return (#f) end;
    for (i from 0 below string.size)
      for (dictionary in dictionaries)
	for (word in dictionary.key-sequence)
	  let limit = i + word.size;
	  if (limit <= string.size)
	    if (find-substring(string, word, start: i, end: limit))
	      return (dictionary[word])
	    end if;
	  end if;
	end for;
      end for;
    end for;
    return (#f);
  end block;
end;

define function calibration
    (string :: <string>) => (calibration :: <integer>)
  let first = find-number($forward-dictionaries, string) | "0";
  let last  = find-number($reversed-dictionaries, reverse(string)) | "0";
  string-to-integer(concatenate(first, last));
end;

