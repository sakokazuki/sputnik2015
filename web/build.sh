# runserver
php -S 0.0.0.0:8000 -t . &
# coffee
coffee -o build/js -wmcb app/coffee/*coffee &
# sass
node-sass --watch app/sass:build/css &

alias killproj='killall php coffee sass'
