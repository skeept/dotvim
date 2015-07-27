xxxtest = {}
function xxxtest.WriteFile (str)
    return vim.eval(string.format("WriteFile(%q)", str))
end
return xxxtest
