Module: dylan-user
Synopsis: Module and library definition for executable application

define library conumdrum-app
  use common-dylan;
  use conumdrum;
  use io, import: { format-out };
end library;

define module conumdrum-app
  use common-dylan;
  use format-out;
  use conumdrum;
end module;
