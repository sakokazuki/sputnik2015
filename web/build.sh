# runserver
php -S 0.0.0.0:8000 -t ./build &
# coffee
coffee -o build/js -wmc app/coffee/*coffee &
# sass
sass --watch app/sass:build/css &

alias killproj='killall php coffee sass'