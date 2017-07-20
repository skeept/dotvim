module XXXTest
    def WriteFile(str)
        VIM::evaluate("WriteFile('"+str+"')")
    end
    module_function :WriteFile
end
