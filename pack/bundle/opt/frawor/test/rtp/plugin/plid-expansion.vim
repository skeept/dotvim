execute frawor#Setup('0.0', {'@exptest'   : '0.0',
            \                '@%exptest'  : '0.0',
            \                '@:exptest'  : '0.0',
            \                '@/resources': '0.0',
            \                '@./exptest' : '0.0',})
call WriteFile(string(sort(keys(s:_f))))

