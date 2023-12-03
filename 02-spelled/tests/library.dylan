Module: dylan-user

define library spelled-test-suite
  use common-dylan;
  use testworks;
  use spelled;
end library;

define module spelled-test-suite
  use common-dylan;
  use testworks;
  use spelled;
  use spelled-impl;
end module;
