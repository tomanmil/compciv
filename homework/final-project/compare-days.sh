# This script compares Supreme Court opinions downloaded from supremecourt.gov at different times
# Some downloaded files may not have been properly formed pdfs which resulted in some runtime errors
mkdir -p html

first_days=$(ls data-hold/pdfs | sort | head -n -1)
second_days=$(ls data-hold/pdfs | sort | tail -n +2)
for i in $first_days; do
  last=$(echo $second_days | cut -d ' ' -f 1)
  mkdir -p html/$last
  second_days=$(echo $second_days | cut -d ' ' -f 2-)
  subdir=$(ls data-hold/pdfs/$i | sort)
  for j in $subdir; do
    files=$(ls data-hold/pdfs/$i/$j | grep 'pdf' | sort)
    for k in $files; do
      if [[ -f data-hold/pdfs/$i/$j/$k ]]; then
      echo "comparing data-hold/pdfs/$i/$j/$k to data/hold/pdfs/$last/$j/$k"
      pdftotext data-hold/pdfs/$i/$j/$k
      pdftotext data-hold/pdfs/$last/$j/$k
      n=$(echo $k | sed 's/pdf/txt/')
      q=$(echo $k | sed 's/pdf/html/')
      python track-changes.py data-hold/pdfs/$i/$j/$n data-hold/pdfs/$last/$j/$n html/$last/$q
      fi
    done
  done
done
