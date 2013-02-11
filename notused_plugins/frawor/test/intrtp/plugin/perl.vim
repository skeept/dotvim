execute frawor#Setup('0.0', {'@/perl': '0.0'})
if has("perl")
    perl use XXXTest;
    perl XXXTest::WriteFile("perl-test");
endif
