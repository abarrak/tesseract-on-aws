#!/bin/bash

## Script for getting training files for all languages.
## Entended for latest training files (V. 3.04)
## Author: Abdullah Barrak (github.com/abarrak)

# Counterpart full names  ..
# [107 langs and Scripts] ..
# ..........................
# Afrikaans | Amharic | Arabic | Assamese | Azerbaijani | Azerbaijani - Cyrilic | Belarusian | Bengali | Tibetan | Bosnian | Bulgarian | Catalan; Valencian | Cebuano | Czech | Chinese - Simplified | Chinese - Traditional | Cherokee | Welsh | Danish | Danish - Fraktur | German | German - Fraktur | Dzongkha | Greek, Modern (1453-) | English | English, Middle (1100-1500) | Esperanto | Math/equation detection module | Estonian | Basque | Persian | Finnish | French | Frankish | French, Middle (ca.1400-1600) | Irish | Galician | Greek, Ancient (to 1453) | Gujarati | Haitian; Haitian Creole | Hebrew | Hindi | Croatian | Hungarian | Inuktitut | Indonesian | Icelandic | Italian | Italian - Old | Javanese | Japanese | Kannada | Georgian | Georgian - Old | Kazakh | Central Khmer | Kirghiz; Kyrgyz | Korean | Kurdish | Lao | Latin | Latvian | Lithuanian | Malayalam | Marathi | Macedonian | Maltese | Malay | Burmese | Nepali | Dutch; Flemish | Norwegian | Oriya | Orientation and script detection module | Panjabi; Punjabi | Polish | Portuguese | Pushto; Pashto | Romanian; Moldavian; Moldovan | Russian | Sanskrit | Sinhala; Sinhalese | Slovak | Slovak - Fraktur | Slovenian | Spanish; Castilian | Spanish; Castilian - Old | Albanian | Serbian | Serbian - Latin | Swahili | Swedish | Syriac | Tamil | Telugu | Tajik | Tagalog | Thai | Tigrinya | Turkish | Uighur; Uyghur | Ukrainian | Urdu | Uzbek | Uzbek - Cyrilic | Vietnamese | Yiddish
# ........................

# Codes for -l ..
# [107 code] ....
# ...............
declare -a CODES=("afr" "amh" "ara" "asm" "aze" "aze_cyrl" "bel" "ben" "bod" "bos" "bul" "cat" "ceb" "ces" "chi_sim" "chi_tra" "chr" "cym" "dan" "dan_frak" "deu" "deu_frak" "dzo" "ell" "eng" "enm"  "epo" "equ"  "est" "eus" "fas" "fin" "fra" "frk" "frm" "gle" "glg" "grc" "guj" "hat" "heb" "hin" "hrv" "hun" "iku" "ind" "isl" "ita" "ita_old" "jav" "jpn" "kan" "kat" "kat_old" "kaz" "khm" "kir" "kor" "kur" "lao" "lat" "lav" "lit" "mal" "mar" "mkd" "mlt" "msa" "mya" "nep" "nld" "nor" "ori" "osd" "pan" "pol" "por" "pus" "ron"  "rus" "san" "sin" "slk" "slk_frak" "slv" "spa" "spa_old" "sqi" "srp" "srp_latn" "swa" "swe" "syr" "tam" "tel" "tgk" "tgl" "tha" "tir" "tur" "uig" "ukr" "urd" "uzb" "uzb_cyrl" "vie" "yid")

# Files in Github Repo ..
# [158 Files] ...........
# .......................
declare -a REPO_FILES=("afr.traineddata" "amh.traineddata" "ara.cube.bigrams" "ara.cube.fold" "ara.cube.lm" "ara.cube.nn" "ara.cube.params" "ara.cube.size" "ara.cube.word-freq" "ara.traineddata" "asm.traineddata" "aze.traineddata" "aze_cyrl.traineddata" "bel.traineddata" "ben.traineddata" "bod.traineddata" "bos.traineddata" "bul.traineddata" "cat.traineddata" "ceb.traineddata" "ces.traineddata" "chi_sim.traineddata" "chi_tra.traineddata" "chr.traineddata" "cym.traineddata" "dan.traineddata" "dan_frak.traineddata" "deu.traineddata" "deu_frak.traineddata" "dzo.traineddata" "ell.traineddata" "eng.cube.bigrams" "eng.cube.fold" "eng.cube.lm" "eng.cube.nn" "eng.cube.params" "eng.cube.size" "eng.cube.word-freq" "eng.tesseract_cube.nn" "eng.traineddata" "enm.traineddata" "epo.traineddata" "equ.traineddata" "est.traineddata" "eus.traineddata" "fas.traineddata" "fin.traineddata" "fra.cube.bigrams" "fra.cube.fold" "fra.cube.lm" "fra.cube.nn" "fra.cube.params" "fra.cube.size" "fra.cube.word-freq" "fra.tesseract_cube.nn" "fra.traineddata" "frk.traineddata" "frm.traineddata" "gle.traineddata" "glg.traineddata" "grc.traineddata" "guj.traineddata" "hat.traineddata" "heb.traineddata" "hin.cube.bigrams" "hin.cube.fold" "hin.cube.lm" "hin.cube.nn" "hin.cube.params" "hin.cube.word-freq" "hin.tesseract_cube.nn" "hin.traineddata" "hrv.traineddata" "hun.traineddata" "iku.traineddata" "ind.traineddata" "isl.traineddata" "ita.cube.bigrams" "ita.cube.fold" "ita.cube.lm" "ita.cube.nn" "ita.cube.params" "ita.cube.size" "ita.cube.word-freq" "ita.tesseract_cube.nn" "ita.traineddata" "ita_old.traineddata" "jav.traineddata" "jpn.traineddata" "kan.traineddata" "kat.traineddata" "kat_old.traineddata" "kaz.traineddata" "khm.traineddata" "kir.traineddata" "kor.traineddata" "kur.traineddata" "lao.traineddata" "lat.traineddata" "lav.traineddata" "lit.traineddata" "mal.traineddata" "mar.traineddata" "mkd.traineddata" "mlt.traineddata" "msa.traineddata" "mya.traineddata" "nep.traineddata" "nld.traineddata" "nor.traineddata" "ori.traineddata" "osd.traineddata" "pan.traineddata" "pol.traineddata" "por.traineddata" "pus.traineddata" "ron.traineddata" "rus.cube.fold" "rus.cube.lm" "rus.cube.nn" "rus.cube.params" "rus.cube.size" "rus.cube.word-freq" "rus.traineddata" "san.traineddata" "sin.traineddata" "slk.traineddata" "slk_frak.traineddata" "slv.traineddata" "spa.cube.bigrams" "spa.cube.fold" "spa.cube.lm" "spa.cube.nn" "spa.cube.params" "spa.cube.size" "spa.cube.word-freq" "spa.traineddata" "spa_old.traineddata" "sqi.traineddata" "srp.traineddata" "srp_latn.traineddata" "swa.traineddata" "swe.traineddata" "syr.traineddata" "tam.traineddata" "tel.traineddata" "tgk.traineddata" "tgl.traineddata" "tha.traineddata" "tir.traineddata" "tur.traineddata" "uig.traineddata" "ukr.traineddata" "urd.traineddata" "uzb.traineddata" "uzb_cyrl.traineddata" "vie.traineddata" "yid.traineddata")


TESSERACT_TRDATA_URL="https://raw.githubusercontent.com/tesseract-ocr/tessdata/3.04.00"

cd /usr/local/share/tessdata

for i in "${!REPO_FILES[@]}"
  do
     langfile="${REPO_FILES[i]}"
     printf "\n....|.... Obtaining $langfile Training Data Files ....|....\n"
     sudo wget "$TESSERACT_TRDATA_URL/$langfile"
     printf "\n.........................................................................\n\n"
  done

printf "................................................\n"
echo "Done Processing ${#REPO_FILES[@]} Files !"
printf "................................................\n"
