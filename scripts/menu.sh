#!/bin/bash

for f in $(pwd)/Docs/*.doccarchive/index.html
do
    perl -i -pe  's+rel="stylesheet"></script><noscript>+rel="stylesheet"><link href="/css/menu.css" rel="stylesheet" type="text/css"><script src="/js/menu.js" type="text/javascript"></script></head><body data-color-scheme="auto"><script src="/js/insertmenu.js"></script><noscript>+g' $f
done