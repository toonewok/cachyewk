#!/bin/sh

#variables
ricename=$1
action=$2

confpath=~/.config
gitinpath=$confpath/rice/gitscript
zshpath=$confpath/zsh
ricepath=$confpath/rice/$ricename
ricegitp=$ricepath/gitinstall
rice_cpath=$ricepath/config
cnt=1
#functions

kill_func() {

  pkill waybar
  pkill hyprpaper
  pkill linux-wallpaper
  pkill dunst

}

start_func() {

  nohup waybar >/dev/null 2>&1 &
  nohup hyprpaper >/dev/null 2>&1 &

  if [ "$wallpe" == "true" ]; then

    nohup ~/shellscripts/wallp.sh >/dev/null 2>&1 &

  fi

  if [ "$notif" == "true" ]; then

    nohup dunst >/dev/null 2>&1 &

  fi

}

refresh_func() {

  kill_func
  start_func
  hyprctl reload

}

save_func() {
  echo saving $ricename to $ricepath

  #ensure the rice path exists
  mkdir -p $ricepath
  mkdir -p $rice_cpath
  mkdir -p $ricepath/.themes
  mkdir -p $ricepath/.icons

  #theme
  cp -r ~/.themes/"$GTK_THEME" $ricepath/.themes/
  cp -r ~/.icons/$hyprcur $ricepath/.icons/
  cp -r ~/.icons/"$GTK_ICON_THEME" $ricepath/.icons/
  #zsh
  cp -r $confpath/zsh/ $rice_cpath/
  cp ~/.oh-my-zsh/themes/$zshtheme.zsh-theme $rice_cpath/zsh/
  #hypr
  cp -r $confpath/hypr $rice_cpath/
  #nvim
  cp -r $confpath/nvim $rice_cpath/
  #waybar
  cp -r $confpath/waybar $rice_cpath/
  #rofi
  cp -r $confpath/rofi $rice_cpath/
  #cava
  cp -r $confpath/cava $rice_cpath/

  #dunst
  if [ "$notif" == "true" ]; then
    cp -r $confpath/dunst $rice_cpath/
  fi

  #alacritty
  cp -r $confpath/alacritty $rice_cpath/

  #wlogout
  cp -r $confpath/wlogout $rice_cpath/

  #vesktop theme
  mkdir -p $rice_cpath/vesktop/themes/
  cp $confpath/vesktop/themes/ClearVision-v7-BetterDiscord.theme.css $rice_cpath/vesktop/themes/ClearVision-v7-BetterDiscord.theme.css

  #fastfetch
  cp -r $confpath/fastfetch $rice_cpath/

  #wallpaper
  mkdir -p $ricepath/Pictures/Wallpapers

  grep path ~/.config/hypr/hyprpaper.conf | while IFS= read -r line; do
    value=${line#*= }
    wpath=$(printf '%s\n' "$value" | sed "s|~|$HOME|")
    cp "$wpath" $ricepath/Pictures/Wallpapers
  done

}

####begin
if [ "$ricename" == "refresh" ]; then
  refresh_func
fi

if [ "$action" == "save" ]; then
  if [ "$theme" != "$ricename" ]; then
    echo the rice you are attempting to save to is $ricename...
    echo the system is currently using $theme
    echo are you sure you want to save $theme over $ricename?
    read confirmsave

    if [ "$confirmsave" == "y" ] || [ "$confirmsave" == "Y" ]; then
      save_func
    fi

  else

    save_func

  fi

elif [ "$action" == "apply" ]; then
  echo applying $ricename
  cp $rice_cpath/zsh/envvar $confpath/zsh/

  source $confpath/zsh/envvar

  cp -r $rice_cpath/hypr $confpath/
  cp -r $rice_cpath/nvim $confpath/
  cp -r $rice_cpath/waybar $confpath/
  cp -r $rice_cpath/rofi $confpath/
  cp -r $rice_cpath/cava $confpath/

  if [ "$notif" == "true" ]; then
    cp -r $rice_cpath/dunst $confpath/
  fi

  cp -r $rice_cpath/alacritty $confpath/
  cp -r $rice_cpath/wlogout $confpath/
  cp $rice_cpath/vesktop/themes/ClearVision-v7-BetterDiscord.theme.css $confpath/vesktop/themes/
  cp -r $rice_cpath/fastfetch $confpath/

  refresh_func

elif [ "$action" == "git" ]; then


  echo creating a git install for $ricename
  mkdir -p $ricegitp

  #starts by cloning the base install script
  cp $gitinpath/install $ricegitp/

  #first apply rice name to the initial variable
  sed -i -e "s|<ricenamerep>|$theme|g" $ricegitp/install

  #grab zshrc
  cp $HOME/.zshrc $ricegitp/

  #provide config files to conf
  cp -R $rice_cpath $ricegitp/

	#will now copy generics over uniques for simplicity
	#starting with base monitor layout
	cp $gitinpath/monitors.conf $ricegitp/config/hypr/core/
	cp $gitinpath/winwork.conf $ricegitp/config/hypr/core/

	#the hyprpaper config requires the path to be specified, will pull it from the local to know
		#copies the template hyprpaper
	cp $gitinpath/hyprpaper.conf $ricegitp/config/hypr/
		#hyprpaper file will require the path and image to be specified
		grep path $rice_cpath/hypr/hyprpaper.conf | while IFS= read -r line; do
		#this is a lazy patch, but i dont feel like figuring this out
		#just gonna set a counter and only apply when the counter matches
    		value=${line#*= }
		if [ $cnt == 1 ];
			then
    			bpath=$(printf '%s\n' "$value")
			sed -i -e "s|replaceme|$bpath|g" $ricegitp/config/hypr/hyprpaper.conf
			echo the base path is $bpath
		fi
		cnt=2
    		done

	sed -i -e "s|DP-3|Virtual-1|g" $ricegitp/config/waybar/config.jsonc
	sed -i -e "s|DP-3|Virtual-1|g" $ricegitp/config/waybar/modules.jsonc
	sed -i -e "s|DP-4|Virtual-2|g" $ricegitp/config/waybar/config.jsonc
	sed -i -e "s|DP-4|Virtual-2|g" $ricegitp/config/waybar/modules.jsonc

  #provide images
  cp -R $ricepath/Pictures $ricegitp/


fi
