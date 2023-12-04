Module: dylan-user

define library conumdrum
  use common-dylan;
  use io,
    import: { format-out,
	      print,
	      streams };
  use regular-expressions;

  export
    conumdrum,
    conumdrum-impl;
end library;

define module conumdrum
  create
    <natural>,
    <positive>;

  create
    <color>,
    <game-hand>,
    <game>;

  export
    game-hand-reds,
    game-hand-blues,
    game-hand-greens;

end module;

define module conumdrum-impl
  use common-dylan;
  use print;
  use regular-expressions;
  use streams;
  
  use conumdrum;
end module;
