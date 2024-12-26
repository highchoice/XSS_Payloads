#!/bin/bash

# Clone the repository
echo "Cloning the repository..."
git clone https://github.com/Cybersecurity-Ethical-Hacker/xssuccessor.git || {
    echo "Failed to clone repository."
    exit 1
}
cd xssuccessor || exit 1

# Create dependencies directory
mkdir -p deps
cd deps || exit 1

# List of dependencies to download and install
declare -a packages=(
    "http://archive.ubuntu.com/ubuntu/pool/universe/g/gdk-pixbuf-xlib/libgdk-pixbuf2.0-0_2.40.2-2build4_amd64.deb"
    "http://archive.ubuntu.com/ubuntu/pool/main/i/icu/libicu66_66.1-2ubuntu2.1_amd64.deb"
    "http://archive.ubuntu.com/ubuntu/pool/main/libj/libjpeg-turbo/libjpeg-turbo8_2.0.3-0ubuntu1.20.04.3_amd64.deb"
    "http://archive.ubuntu.com/ubuntu/pool/main/u/unifont/ttf-unifont_12.0.01-2_all.deb"
    "http://archive.ubuntu.com/ubuntu/pool/universe/f/fonts-ubuntu/ttf-ubuntu-font-family_0.83-4ubuntu1_all.deb"
    "http://archive.ubuntu.com/ubuntu/pool/universe/x/x264/libx264-155_0.155.2917+git0a84d98-2_amd64.deb"
    "http://archive.ubuntu.com/ubuntu/pool/universe/e/enchant/libenchant1c2a_1.6.0-11.3build1_amd64.deb"
    "http://archive.ubuntu.com/ubuntu/pool/main/libv/libvpx/libvpx6_1.8.2-1ubuntu0.3_amd64.deb"
    "http://archive.ubuntu.com/ubuntu/pool/main/libw/libwebp/libwebp6_0.6.1-2ubuntu0.20.04.3_amd64.deb"
    "http://archive.ubuntu.com/ubuntu/pool/main/libf/libffi/libffi7_3.3-4_amd64.deb"
    "http://archive.ubuntu.com/ubuntu/pool/main/j/json-glib/libjson-glib-1.0-common_1.4.4-2ubuntu2_all.deb"
    "http://archive.ubuntu.com/ubuntu/pool/main/j/json-glib/libjson-glib-1.0-0_1.4.4-2ubuntu2_amd64.deb"
)

# Download and install packages
for package in "${packages[@]}"; do
    file=$(basename "$package")
    echo "Downloading $file..."
    wget -q "$package" -O "$file" || {
        echo "Failed to download $file."
        exit 1
    }
    echo "Installing $file..."
    sudo dpkg -i "$file" || {
        echo "Error installing $file. Attempting to fix broken dependencies..."
        sudo apt-get install -f -y || exit 1
    }
done

# Install additional dependencies via apt
echo "Installing additional dependencies..."
sudo apt-get install -y libgdk-pixbuf-xlib-2.0-0 fonts-ubuntu libasound2t64 libpng16-16t64 libxt6t64 || {
    echo "Failed to install additional dependencies."
    exit 1
}

# Move back to project root
cd ..

# Install Python dependencies
echo "Installing Python dependencies..."
pip install -r requirements.txt --break-system-packages || exit 1
pip install aiodns playwright --break-system-packages || exit 1

# Install Playwright dependencies and browsers
echo "Setting up Playwright..."
playwright install-deps || exit 1
playwright install || exit 1

echo "Installation complete!"
