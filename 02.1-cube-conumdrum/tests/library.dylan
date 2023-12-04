Module: dylan-user

define library conumdrum-test-suite
  use common-dylan;
  use testworks;
  use conumdrum;
end library;

define module conumdrum-test-suite
  use common-dylan;
  use testworks;
  use conumdrum;
  use conumdrum-impl;
end module;
