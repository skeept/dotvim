require 'command-t/scanner'

module CommandT
    class AurumScanner < Scanner
        def paths
            @paths ||= (::VIM::evaluate "a:files").clone
        end
    end
end
