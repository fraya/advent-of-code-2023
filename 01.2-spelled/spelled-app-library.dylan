Module: dylan-user
Synopsis: Module and library definition for executable application

define library spelled-app
  use common-dylan;
  use collections,
    import: { table-extensions };
  use io,
    import: { format-out };
  use system,
    import: { file-system };
  
  use spelled;
end library;

define module spelled-app
  use common-dylan;
  use file-system;
  use format-out;
  use table-extensions;
  
  use spelled;
end module;
