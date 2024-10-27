imgpath=$(realpath -s $1)
echo "preload = $imgpath
wallpaper = ,$imgpath" > ~/.config/hypr/hyprpaper.conf
pkill hyprpaper
nohup hyprpaper </dev/null >/dev/null 2>&1 &
