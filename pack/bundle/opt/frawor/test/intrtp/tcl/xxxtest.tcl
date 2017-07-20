package provide xxxtest 0.0

namespace eval ::xxxtest {
    namespace export WriteFile
}

proc ::xxxtest::WriteFile {str} {
    ::vim::expr "WriteFile('$str')"
}

