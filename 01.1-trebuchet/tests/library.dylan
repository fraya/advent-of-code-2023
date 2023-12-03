Module: dylan-user

define library trebuchet-test-suite
  use common-dylan;
  use io,
    import: { streams };
  use testworks;
  
  use trebuchet;
end library;

define module trebuchet-test-suite
  use common-dylan;
  use streams;
  use testworks;
  
  use trebuchet;
  use trebuchet-impl;
end module;
