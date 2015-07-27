execute frawor#Setup('0.0', {'@/lua': '0.0'})
if has("lua")
    lua require"xxxtest"
    lua xxxtest.WriteFile("lua-test")
endif
