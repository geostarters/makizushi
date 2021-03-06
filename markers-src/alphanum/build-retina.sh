DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ -z `which inkscape` ]; then
    echo "inkscape command is required."
    echo "Mac OS X users add /Applications/Inkscape.app/Contents/Resources/bin to your PATH."
    exit;
fi

for object in $(inkscape --without-gui -f $DIR/alphanum.svg --query-all |
    sed '/^rect[0-9]*/d; /^path[0-9]*/d; /^g[0-9]/d; /^layer[0-9]*/d; /^svg[0-9]*/d; /^text[0-9]*/d; /^tspan[0-9]*/d' |
    sed 's/-[0-9].*//g' |
    sort |
    uniq)
do
    echo $object
    inkscape --without-gui -f $DIR/alphanum.svg --export-id=$object-12 -e=$DIR/$object-12.png -w 12 -h 12
    inkscape --without-gui -f $DIR/alphanum.svg --export-id=$object-18 -e=$DIR/$object-18.png -w 18 -h 18
    inkscape --without-gui -f $DIR/alphanum.svg --export-id=$object-24 -e=$DIR/$object-24.png -w 24 -h 24
    inkscape --without-gui -f $DIR/alphanum.svg --export-id=$object-24 -e=$DIR/$object-12@2x.png -w 24 -h 24
    inkscape --without-gui -f $DIR/alphanum.svg --export-id=$object-18 -e=$DIR/$object-18@2x.png -w 36 -h 36
    inkscape --without-gui -f $DIR/alphanum.svg --export-id=$object-24 -e=$DIR/$object-24@2x.png -w 48 -h 48
done
