# Deploy Tesseract to AWS Elastic Beanstalk.

## Introduction
The repo gives the necessary steps to set the latest [Tesseract OCR engine](https://github.com/tesseract-ocr/tesseract) (3.04.01) on a AWS EC virtual machine.
Alternatively, you can copy `tess-deploy.sh` script, then run for once. `sudo bash tess-deploy.sh` 😁.
    
---
## [1] SSH to your EC instance
```sh
ssh <environment_name>
sudo yum update
```

## [2] Dependencies
```sh
sudo yum install autoconf aclocal automake
sudo yum install libtool
sudo yum install libjpeg-devel libpng-devel libtiff-devel zlib-devel
```
## [3] Install Leptonica
```sh
cd ~/libs
mkdir leptonica && cd leptonica
wget http://www.leptonica.com/source/leptonica-1.73.tar.gz
tar -zxvf leptonica-1.73.tar.gz
rm leptonica-1.73.tar.gz
cd leptonica-1.73
./configure
make
sudo make install
```
## [4] Install Tesseract
```sh
cd ~
mkdir tesseract && cd tesseract
wget https://github.com/tesseract-ocr/tesseract/archive/3.04.01.tar.gz
tar -zxvf 3.04.01.tar.gz
rm 3.04.01.tar.gz
cd tesseract-3.04.01
./autogen.sh
./configure
make
sudo make install
sudo ldconfig
```
## [5] Tesseract Training Data.
```sh
cd /usr/local/share/tessdata
sudo wget http://tesseract-ocr.googlecode.com/files/tesseract-ocr-3.02.eng.tar.gz
sudo tar xvf tesseract-ocr-3.02.eng.tar.gz
sudo rm tesseract-ocr-3.02.eng.tar.gz
export TESSDATA_PREFIX=/usr/local/share/
sudo mv tesseract-ocr/tessdata/* .
```

## [6] Source TESSERACT_PREFIX
```sh
nano ~/.bash_profile
```

### Then Copy this line to the end:
```sh
export TESSDATA_PREFIX=/usr/local/share/
```

## [7] Verify
```sh
tesseract
```

---
## Notes
(1) - Use [`grap-train-langs.sh`](https://github.com/abarrak/tesseract-on-aws/blob/master/grap-train-langs.sh) to obtain all language training files, or customize as your needs.

---
## Credits
* [Alan Gunning](https://github.com/alangunning), author of the original blog post.
* [shantanusingh](https://gist.github.com/shantanusingh), author of [Tesseract-Amazon-AMI](https://gist.github.com/shantanusingh/6526664/revisions) gist.
* [Abdullah Barrak](https://github.com/abarrak) upgrade, and shell scripts.
