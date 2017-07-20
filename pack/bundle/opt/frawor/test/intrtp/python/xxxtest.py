import vim
def WriteFile(string):
    return vim.eval("WriteFile('"+string.replace("'", "''")+"')")

