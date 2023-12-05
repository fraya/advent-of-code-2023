Module: dylan-user

define library conumdrum
  use common-dylan;
  use io,
    import: { format,
	      format-out,
	      print,
	      streams };
  use regular-expressions;
  use strings;

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
    <game>;

  export
    make-game,
    game-id;

end module;

define module conumdrum-impl
  use common-dylan;
  use format;
  use format-out;
  use print;
  use regular-expressions;
  use streams;
  use strings, import { strip };
  
  use conumdrum;
end module;
