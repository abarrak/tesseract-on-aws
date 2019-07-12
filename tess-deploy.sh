#!/bin/bash

# Configure ..
LEPTONICA_VERSION=1.73
LEPTONICA_FILE=leptonica-$LEPTONICA_VERSION.tar.gz
LEPTONICA_URL=http://www.leptonica.org/source/$LEPTONICA_FILE

TESSERACT_VERSION=3.04.01
TESSERACT_TRDATA_VERSION=3.02
TESSERACT_TRDATA_LANG="eng"

TESSERACT_FILE="$TESSERACT_VERSION.tar.gz"
TESSERACT_TRDATA_FILE="tesseract-ocr-$TESSERACT_TRDATA_VERSION.$TESSERACT_TRDATA_LANG.tar.gz"

TESSERACT_URL="https://github.com/tesseract-ocr/tesseract/archive/$TESSERACT_FILE"
TESSERACT_TRDATA_URL="http://tesseract-ocr.googlecode.com/files/$TESSERACT_TRDATA_FILE"


# Start ..
sudo yum update
sudo yum install autoconf aclocal automake
sudo yum install libtool
sudo yum install libjpeg-devel libpng-devel libtiff-devel zlib-devel

mkdir ~/libs
cd ~/libs
mkdir leptonica && cd leptonica
wget $LEPTONICA_URL
tar -zxvf $LEPTONICA_FILE
rm $LEPTONICA_FILE
cd leptonica-$LEPTONICA_VERSION
./configure
make    # Takes ~4 min. on T2.micro Instance machine (Free Tier).
sudo make install

cd ~/libs
mkdir tesseract && cd tesseract
wget $TESSERACT_URL
tar -zxvf $TESSERACT_FILE
sudo rm $TESSERACT_FILE
cd tesseract-$TESSERACT_VERSION
./autogen.sh
./configure
make  # Takes ~6 min. on T2.micro instance (Free Tier).
sudo make install
sudo ldconfig

cd /usr/local/share/tessdata
sudo wget $TESSERACT_TRDATA_URL
sudo tar xvf $TESSERACT_TRDATA_FILE
sudo rm $TESSERACT_TRDATA_FILE
export TESSDATA_PREFIX=/usr/local/share/
sudo mv tesseract-ocr/tessdata/* .

cd ~
echo "export TESSDATA_PREFIX=/usr/local/share/" >> .bash_profile
