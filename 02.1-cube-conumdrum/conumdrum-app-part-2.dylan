Module: conumdrum-app-part-2

define function main
    (name :: <string>, arguments :: <vector>)

  if (arguments.size < 1)
    format-err("USAGE:\n\t%s <file>\n", name);
    exit-application(1);
  end if;
  
  let filename = arguments[0];
  if (~file-exists?(filename))
    format-err("Error: file '%s' does not exists\n", filename);
    exit-application(1);
  end if;

  let sum = 0;
  with-open-file (fs = filename)
    for (line = read-line(fs, on-end-of-stream: #f)
	   then read-line(fs, on-end-of-stream: #f),
	 while: line)
      let game  = make-game(line);
      let cubes = minimum-cubes-for-game(game);
      let power = power-of-cubes(cubes);
      sum := sum + power;
    end for;
  end with-open-file;

  format-out("Sum of power: = %d\n", sum);
  exit-application(0);
end function;

main(application-name(), application-arguments());
