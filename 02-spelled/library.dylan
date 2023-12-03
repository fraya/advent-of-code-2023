Module: dylan-user

define library spelled
  use common-dylan;
  use collections,
    import: { table-extensions };
  use io,
    import: { format-out,
	      streams };
  use strings;
  
  export
    spelled,
    spelled-impl;
end library;

define module spelled
  export
    calibration,
    read-lines;
end module;

define module spelled-impl
  use common-dylan;
  use common-extensions,
    import: { integer-to-string };
  use format-out;
  use streams;
  use strings,
    import: { find-substring };
  use table-extensions;
  
  use spelled;

end module;
