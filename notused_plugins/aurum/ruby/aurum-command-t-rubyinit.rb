require 'command-t/finder/aurum_finder'
require 'command-t/vim'
def $command_t.aurum_finder
    CommandT::AurumFinder.new
end
def $command_t.show_aurum_finder
    @path          = CommandT::VIM::pwd
    @active_finder = aurum_finder
    show
end
