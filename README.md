## Deploy Tesseract to AWS Elastic Beanstalk.

### Introduction
The repo gives the necessary steps to set the latest [Tesseract OCR engine](https://github.com/tesseract-ocr/tesseract) (3.04.01) on a AWS EC virtual machine.
Alternatively, you can copy `tess-deploy.sh` script, then run for once. `sudo bash tess-deploy.sh` 😁.
---

#### [1] SSH to your EC instance
`eb ssh <environment_name>`

`sudo yum update`

#### [2] Dependencies
`sudo yum install autoconf aclocal automake`
`sudo yum install libtool`
`sudo yum install libjpeg-devel libpng-devel libtiff-devel zlib-devel`

#### [3] Install Leptonica
`cd ~/libs`
`mkdir leptonica && cd leptonica`
`wget http://www.leptonica.com/source/leptonica-1.73.tar.gz`
`tar -zxvf leptonica-1.73.tar.gz`
`rm leptonica-1.73.tar.gz`
`cd leptonica-1.73`
`./configure`
`make`    # Takes ~4 min. on T2.micro Instance machine (Free Tier).
`sudo make install`

#### [4] Install Tesseract
`cd ~`
`mkdir tesseract && cd tesseract`
`wget https://github.com/tesseract-ocr/tesseract/archive/3.04.01.tar.gz`
`tar -zxvf 3.04.01.tar.gz`
`rm 3.04.01.tar.gz`
`cd tesseract-3.04.01`
`./autogen.sh`
`./configure`
`make`  # Takes ~6 min. on T2.micro instance (Free Tier).
`sudo make install`
`sudo ldconfig`

#### [5] Tesseract Training Data.
`cd /usr/local/share/tessdata`
`sudo wget http://tesseract-ocr.googlecode.com/files/tesseract-ocr-3.02.eng.tar.gz`
`sudo tar xvf tesseract-ocr-3.02.eng.tar.gz`
`sudo rm tesseract-ocr-3.02.eng.tar.gz`
`export TESSDATA_PREFIX=/usr/local/share/`
`sudo mv tesseract-ocr/tessdata/* .`

#### [6] Source TESSERACT_PREFIX
`nano ~/.bash_profile`
##### Then Copy this line to the end:
`export TESSDATA_PREFIX=/usr/local/share/`

#### Verify
`tesseract`

---
### Notes

---
### Credits
* [Alan Gunning](https://github.com/alangunning), author of the original blog post.
* [shantanusingh](https://gist.github.com/shantanusingh), author of [Tesseract-Amazon-AMI](https://gist.github.com/shantanusingh/6526664/revisions) gist.
* [Abdullah Barrak](https://github.com/abarrak) upgrade, and shell script.
