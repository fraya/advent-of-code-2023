Module: conumdrum-app

define function main
    (name :: <string>, arguments :: <vector>)

  if (arguments.size < 1)
    format-err("USAGE:\n\t%s <file>\n", name);
    exit-application(1);
  end;

  let filename = arguments[0];
  if (~file-exists?(filename))
    format-err("Error: file '%s' does not exists\n", filename);
    exit-application(1);
  end;

  with-open-file (fs = filename)
    format-out("Reading file '%s'\n", filename);
    force-out();   
    for (line = read-line(fs, on-end-of-stream: #f)
	   then read-line(fs, on-end-of-stream: #f),
	 while: line)
      let game = make(<game>, record: line);
      format-out("Game %= parsed\n", game);
      force-out();
    end;
  end;

  exit-application(0);
end function;

main(application-name(), application-arguments());
