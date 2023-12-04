Module: dylan-user
Synopsis: Module and library definition for executable application

define library conumdrum-app
  use common-dylan;
  use io,
    import: { format-out, streams };
  use system,
    import: { file-system };

  use conumdrum;
end library;

define module conumdrum-app
  use common-dylan;
  use file-system;
  use format-out;
  use streams;
  
  use conumdrum;
end module;
