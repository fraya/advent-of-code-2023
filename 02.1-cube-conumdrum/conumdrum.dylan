Module: conumdrum-impl

define constant <natural>
  = limited(<integer>, min: 0);

define constant <positive>
  = limited(<integer>, min: 1);
  
define constant <color>
  = one-of(#"blue", #"green", #"red");

define constant $re-game-id :: <regex>
  = compile-regex("Game (\\d):.*");

define class <game-hand> (<object>)
  slot game-hand-reds :: <natural>,
    init-keyword: reds:,
    setter: #f,
    init-value: 0;
  slot game-hand-greens :: <natural>,
    init-keyword: greens:,
    setter: #f,
    init-value: 0;
  slot game-hand-blues :: <natural>,
    init-keyword: blues:,
    setter: #f,
    init-value: 0;
end class;

define class <game> (<object>)
  slot game-record :: <string>,
    required-init-keyword: record:,
    setter: #f;
  virtual slot game-id :: <string>,
    setter: #f;
end class;

define method print-object
    (game :: <game>, stream :: <stream>) => ()
  write(stream, game.game-id)
end;

define method game-id
    (game :: <game>) => (id :: <string>)
  let match = regex-search($re-game-id, game.game-record);
  if (match)
    match-group(match, 1)
  else
    error("Can't parse game id: %s", game.game-record)
  end
end method;

