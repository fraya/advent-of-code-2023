Module: conumdrum-impl

define constant <natural>
  = limited(<integer>, min: 0);

define constant <positive>
  = limited(<integer>, min: 1);
  
define constant <color>
  = one-of(#"blue", #"green", #"red");

define class <hand> (<object>)
  slot hand-cubes :: <table> = make(<stretchy);
end;

define class <game> (<object>)
  constant slot game-id :: <positive>,
    required-init-keyword: id:;
  slot game-hands :: <sequence> = make(<stretchy-vector>);
end;
  
