Module: dylan-user
Synopsis: Trebuchet app libraries

define library trebuchet-app
  use common-dylan;
  use io,
    import: { format-out, streams };
  use system,
    import: { file-system };
  use trebuchet;
end library;

define module trebuchet-app
  use common-dylan;
  use file-system;
  use format-out;
  use streams;
  use trebuchet;
end module;
