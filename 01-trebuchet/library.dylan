Module: dylan-user

define library trebuchet
  use common-dylan;
  use io,
    import: { format,
	      format-out,
	      streams };
  use strings;
  use system,
    import: { file-system };

  export
    trebuchet,
    trebuchet-impl;
end library;

define module trebuchet  
//  create
//    <line-wrapper-stream>;

  export
    calibration,
    read-lines,
end module;

define module trebuchet-impl
  use common-dylan;
  use format,
    import: { format-to-string };
  use streams;
  use strings,
    import: { decimal-digit? };
  
  use trebuchet;
end module;
