#!/bin/bash
FILES=`find src -name *.java`
for ff in $FILES; do
    echo $ff
    sed -e 's/GenOpt(R) 3.1.0/GenOpt(R) 3.1.1/g' $ff > $ff.AAAA
    mv $ff.AAAA $ff
    sed -e 's/(December 8, 2011)/(March 24, 2016)/g' $ff > $ff.AAAA
    mv $ff.AAAA $ff
done

FILES=`find ./ \( -name '*.java' -or -name '*.html' \)`
for ff in $FILES; do
    sed -e 's/GenOpt Copyright (c) 1998-2011/GenOpt Copyright (c) 1998-2016/g' $ff > $ff.AAAA
    mv $ff.AAAA $ff
done

FIL=install/info.html
sed -e 's/3.1.0/3.1.1/g' $FIL > $FIL.AAAA
if [ "$?" != "0" ]; then
    echo "Error in replacing string in $FIL"
    echo "Exit with error"
    exit 1
fi
mv $FIL.AAAA $FIL


FIL=install/install.xml
sed -e 's/3.1.0/3.1.1/g' $FIL > $FIL.AAAA
if [ "$?" != "0" ]; then
    echo "Error in replacing string in $FIL"
    echo "Exit with error"
    exit 1
fi
mv $FIL.AAAA $FIL
