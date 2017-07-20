execute frawor#Setup('0.0', {'@/python': '1.0'})
if has('python')
    python import xxxtest
    python xxxtest.WriteFile('python-test')
endif

