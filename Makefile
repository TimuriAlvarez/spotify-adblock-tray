help:
	cat Makefile

TARGET='./build'

build:
	mkdir -p $(TARGET)
	cmake -DCMAKE_BUILD_TYPE=Release -B$(TARGET) .
	make -C $(TARGET)

install:
	make build
	sudo cp -f ./build/spotify-tray /usr/local/bin/spotify-tray
	sudo mkdir -p /usr/local/share/applications
	sudo cp -f ./xdg/spotify-tray.desktop /usr/local/share/applications/spotify-adblock-tray.desktop

uninstall:
	sudo rm -f /usr/local/bin/spotify-tray
	sudo rm -f /usr/local/share/applications/spotify-adblock-tray.desktop

reinstall:
	make uninstall
	make install

clean:
	rm -Rf $(TARGET)
