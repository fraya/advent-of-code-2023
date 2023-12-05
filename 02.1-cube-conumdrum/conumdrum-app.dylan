Module: conumdrum-app

define function main
    (name :: <string>, arguments :: <vector>)
  local method color-of (index)
	  string-to-integer(arguments[index])
	end;

  if (arguments.size < 4)
    format-err("USAGE:\n\t%s <file> <red> <green> <blue>\n", name);
    exit-application(1);
  end;
  
  let filename = arguments[0];
  if (~file-exists?(filename))
    format-err("Error: file '%s' does not exists\n", filename);
    exit-application(1);
  end;

  let r = color-of(1);
  let g = color-of(2);
  let b = color-of(3);
  let bag = tabling(<cubes>, #"red" => r, #"green" => g, #"blue" => b);

  let games = make(<stretchy-vector>);
  with-open-file (fs = filename)
    for (line = read-line(fs, on-end-of-stream: #f)
	   then read-line(fs, on-end-of-stream: #f),
	 while: line)
      add!(games, make-game(line))
    end;
  end;

  let possible-games = games-possible(bag, games);
  let sum = sum-of-ids(possible-games);
  format-out("Sum of IDs = %d\n", sum);

  exit-application(0);
end function;

main(application-name(), application-arguments());
