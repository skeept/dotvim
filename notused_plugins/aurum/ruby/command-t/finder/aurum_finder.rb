require 'command-t/ext'
require 'command-t/scanner/aurum_scanner'
require 'command-t/finder'

module CommandT
    class AurumFinder < Finder
        def initialize
            @scanner = AurumScanner.new
            @matcher = Matcher.new @scanner, :always_show_dot_files => true
        end

        def open_selection command, selection, options
            selection = selection.gsub(/["\\\n]/) {|s|
                {'"'  => "\\\"",
                 "\n" => "\\n",
                 "\\" => "\\\\"}[s]}
            ::VIM::evaluate "call(b:aurum_cbfun, [\"#{selection}\"]+b:aurum_cbargs, {})"
        end
    end
end
