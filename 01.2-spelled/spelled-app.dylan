Module: spelled-app

define function main
    (name :: <string>, arguments :: <vector>)
  
  if (arguments.size < 1)
    format-err("USAGE: %s <filename>\n", name);
    exit-application(1);
  end if;

  let filename = arguments[0];
  let total = 0;

  with-open-file (fs = filename, element-type: <character>)
    for (line in read-lines(fs))
      let number = calibration(line);
      format-out("%s => %d\n", line, number); force-out();
      total := total + number;
    end for;
      //let total = reduce1(\+, map(process-line, read-lines(fs)));
    format-out("Total: %d\n", total);
  end with-open-file;

  exit-application(0);
end function;

main(application-name(), application-arguments());
