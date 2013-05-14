require 'command-t/finder/aurum_finder'
require 'command-t/controller'
require 'command-t/vim'

module CommandT
    class AurumController < Controller
        def show_aurum_finder
            @path          = VIM::pwd
            @active_finder = aurum_finder
            show
        end

        def aurum_finder
            CommandT::AurumFinder.new
        end
    end
end
