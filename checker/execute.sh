#!/bin/bash

if [ "$#" -ne 1 ];
then
    echo "Pass firstArg => URL of the site to be verified"
else
    inputURL=$1
    echo "Given "$inputURL
    rm -rf HTMLSourceFiles dynamicDOMElements.html
    mkdir HTMLSourceFiles
    chmod -R 775 HTMLSourceFiles
    casperjs casperValidation.js --url=$inputURL
    python mergeFiles.py $inputURL
    chmod 775 dynamicDOMElements.html
fi
echo $?
