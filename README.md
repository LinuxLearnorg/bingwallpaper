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
just clone  the repo and make the scripts executable 
	chmod +x Bingwall-kde*
now you are good to go and test is

	./Bingwall-kde1.sh
	./Bingwall-kde2.sh
