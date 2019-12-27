# Gnome and KDE Bing wallpaper Changer

### Gnome Desktop
script to auto download image from Bing and set it as background 
before you use these two you need some package:

- Curl
- gsettings-desktop-schemas

#####debian Based
	 sudo apt install curl gsettings-desktop-schemas
#####rpm Based
	 sudo dnf install curl gsettings-desktop-schemas

copy it wherever you want then add the path to PATH variable
with command chmod add +x to th files

	chmod +x Bingwall-gnome*

now you are good to go and test is

	./Bingwall-gnome1.sh
	./Bingwall-gnome2.sh

### KDE Desktop
for kde desktop wallpaper changer we are gonna use a python3 scripts named "ksetwallpaper.py"  just download and put it inside your bin directory in your home folder
clone  the repo and make the scripts executable 

	chmod +x Bingwall-kde*

now you are good to go and test is

	./Bingwall-kde1.sh
	./Bingwall-kde2.sh

once you run the scripts it will download the latest bing picure and set it as your desktop wallpaper
feel free to share and develop it

Peace
