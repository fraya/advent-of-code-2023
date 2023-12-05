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
    <cubes>,
    <game>;

  export
    make-game,
    games-possible,
    sum-of-ids,
    minimum-cubes-for-game,
    power-of-cubes;

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
