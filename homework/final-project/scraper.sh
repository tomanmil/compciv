# Scrapes opinions from supremecourt.gov
# Must be run at least twice to use compare-days.sh
mkdir -p data-hold
stamp=$(date +%Y-%m-%d-%H)
mkdir -p "data-hold/pdfs/$stamp"
yrs=$(seq 10 14)
for year in $(echo "09 $yrs"); do
  filename="$year.html"
  curl "http://www.supremecourt.gov/opinions/slipopinion/$year" -s -o "data-hold/$filename"
  mkdir -p "data-hold/pdfs/$stamp/$year"
  for pdfname in $(cat "data-hold/$filename" | pup 'table td:nth-of-type(4) a attr{href}' | grep 'pdf'); do
  fn=$(echo $pdfname | cut -d '/' -f 4)
  curl "http://www.supremecourt.gov/$pdfname" -s -o "data-hold/pdfs/$stamp/$year/$fn"
  done
done
