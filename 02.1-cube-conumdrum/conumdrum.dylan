Module: conumdrum-impl

define constant <natural>
  = limited(<integer>, min: 0);

define constant <positive>
  = limited(<integer>, min: 1);
  
define constant <color>
  = one-of(#"blue", #"green", #"red");

define constant $colors
  = #(#"red", #"blue", #"green");

define constant $re-game :: <regex>
  = compile-regex("Game (\\d+):(.*)");

define constant $re-cube :: <regex>
  = compile-regex("\\s*(\\d+)\\s(\\w+)");

define constant <cubes> = <object-table>;

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

define function make-cubes
    (line :: <string>) => (cubes :: <cubes>)
  let cubes = make(<cubes>);
  for (cube in split(strip(line), ","))
    let match-cube = regex-search($re-cube, strip(cube));
    if (match-cube)
      let amount = string-to-integer(match-group(match-cube, 1));
      let color  = as(<symbol>, match-group(match-cube, 2));
      cubes[color] := amount
    else
      error("Can't parse game round: %s", line);
    end if;
  end for;
  cubes
end;

define method make-game
    (log :: <string>) => (game :: <game>)
  let match-game  = regex-search($re-game, log);
  if (match-game)
    let id     = match-group(match-game, 1);
    let rounds = split(match-group(match-game, 2), ";");
    make(<game>, id: id, rounds: map(make-cubes, rounds))
  else
    error("Can't parse game id: %s", log)
  end if;
end method;

define method game-possible?
    (bag :: <cubes>, cubes :: <cubes>)
 => (possible? :: <boolean>)
  block (return)
    for (color in bag.key-sequence)
      let bag-amount   = bag[color];
      let cubes-amount = element(cubes, color, default: 0);
      if (cubes-amount > bag-amount)
	return (#f)
      end;
    end for;
    return (#t)
  end block;
end;

define method game-possible?
    (bag :: <cubes>, game :: <game>)
 => (possible? :: <boolean>)
  every?(curry(game-possible?, bag), game.game-rounds)
end;

define function games-possible
    (bag :: <cubes>, games :: <sequence>)
 => (possibles :: <sequence>)
  choose(curry(game-possible?, bag), games)
end;

define function sum-of-ids
    (games :: <sequence>)
 => (sum :: <integer>)
  let fn = compose(string-to-integer, game-id);
  reduce1(\+, map(fn, games))
end;

define function minimum-cubes-for-game
    (game :: <game>) => (cubes :: <cubes>)
  local method color-of-round (color, round)
	  element(round, color, default: 0)
	end;
  let cubes = make(<cubes>);
  for (color in $colors)
    let color-of  = curry(color-of-round, color);
    let min-value = apply(max, map(color-of, game.game-rounds));
    cubes[color] := min-value
  end for;
  cubes
end;

define function power-of-cubes
    (cubes :: <cubes>) => (power :: <integer>)
  let power = 1;
  for (color in cubes.key-sequence)
    power := power * cubes[color];
  end;
  power
end;
