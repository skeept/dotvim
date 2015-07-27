execute frawor#Setup('0.0', {'@/ruby': '0.0'})
if has("ruby")
    ruby require "xxxtest.rb"
    ruby XXXTest::WriteFile("ruby-test")
endif
