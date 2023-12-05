Module: conumdrum-impl

define constant <natural>
  = limited(<integer>, min: 0);

define constant <positive>
  = limited(<integer>, min: 1);
  
define constant <color>
  = one-of(#"blue", #"green", #"red");

define constant $re-game :: <regex>
  = compile-regex("Game (\\d+):(.*)");

define constant $re-cube :: <regex>
  = compile-regex("\\s*(\\d+)\\s(\\w+)");

define constant <round> = <object-table>;

define class <game> (<object>)
  constant slot game-id :: <string> = "0",
    init-keyword: id:;
  constant slot game-rounds :: <sequence> = make(<stretchy-vector>),
    init-keyword: rounds:;
end class;

define method print-object
    (game :: <game>, stream :: <stream>) => ()
  format(stream, "<game> %s %=", game.game-id, game.game-rounds)
end;

define function make-round
    (line :: <string>) => (round :: <round>)
  let round = make(<round>);
  for (cube in split(strip(line), ","))
    let match-cube = regex-search($re-cube, strip(cube));
    if (match-cube)
      let amount = string-to-integer(match-group(match-cube, 1));
      let color  = as(<symbol>, match-group(match-cube, 2));
      round[color] := amount
    else
      error("Can't parse game hand: %s", line);
    end if;
  end for;
  round
end;

define method make-game
    (log :: <string>) => (game :: <game>)
  let match-game  = regex-search($re-game, log);
  if (match-game)
    let id     = match-group(match-game, 1);
    let rounds = split(match-group(match-game, 2), ";");
    make(<game>, id: id, rounds: map(make-round, rounds))
  else
    error("Can't parse game id: %s", log)
  end if;
end method;

