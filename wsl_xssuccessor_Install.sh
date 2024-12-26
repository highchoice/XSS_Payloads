git clone https://github.com/Cybersecurity-Ethical-Hacker/xssuccessor.git
cd xssuccessor
mkdir deps
cd deps
wget http://archive.ubuntu.com/ubuntu/pool/universe/g/gdk-pixbuf-xlib/libgdk-pixbuf2.0-0_2.40.2-2build4_amd64.deb
sudo apt-get install libgdk-pixbuf-xlib-2.0-0 -y
sudo dpkg -i libgdk-pixbuf2.0-0_2.40.2-2build4_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/i/icu/libicu66_66.1-2ubuntu2.1_amd64.deb
sudo dpkg -i libicu66_66.1-2ubuntu2.1_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/libj/libjpeg-turbo/libjpeg-turbo8_2.0.3-0ubuntu1.20.04.3_amd64.deb
sudo dpkg -i libjpeg-turbo8_2.0.3-0ubuntu1.20.04.3_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/u/unifont/ttf-unifont_12.0.01-2_all.deb
sudo dpkg -i ttf-unifont_12.0.01-2_all.deb
wget http://archive.ubuntu.com/ubuntu/pool/universe/f/fonts-ubuntu/ttf-ubuntu-font-family_0.83-4ubuntu1_all.deb
sudo apt-get install fonts-ubuntu -y
sudo dpkg -i ttf-ubuntu-font-family_0.83-4ubuntu1_all.deb
wget http://archive.ubuntu.com/ubuntu/pool/universe/x/x264/libx264-155_0.155.2917+git0a84d98-2_amd64.deb
sudo dpkg -i libx264-155_0.155.2917+git0a84d98-2_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/universe/e/enchant/libenchant1c2a_1.6.0-11.3build1_amd64.deb
sudo apt --fix-broken install -y
sudo dpkg -i libenchant1c2a_1.6.0-11.3build1_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/libv/libvpx/libvpx6_1.8.2-1ubuntu0.3_amd64.deb
sudo dpkg -i libvpx6_1.8.2-1ubuntu0.3_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/libw/libwebp/libwebp6_0.6.1-2ubuntu0.20.04.3_amd64.deb
sudo dpkg -i libwebp6_0.6.1-2ubuntu0.20.04.3_amd64.deb
sudo apt-get install libasound2t64 -y
sudo apt-get install libpng16-16t64 -y
sudo apt-get install libxt6t64 -y
wget http://archive.ubuntu.com/ubuntu/pool/main/libf/libffi/libffi7_3.3-4_amd64.deb
sudo dpkg -i libffi7_3.3-4_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/j/json-glib/libjson-glib-1.0-common_1.4.4-2ubuntu2_all.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/j/json-glib/libjson-glib-1.0-0_1.4.4-2ubuntu2_amd64.deb
sudo dpkg -i libjson-glib-1.0-common_1.4.4-2ubuntu2_all.deb
sudo dpkg -i libjson-glib-1.0-0_1.4.4-2ubuntu2_amd64.deb
cd ..
pip install -r requirements.txt
pip install aiodns
pip install playwright
playwright install-deps
playwright install
