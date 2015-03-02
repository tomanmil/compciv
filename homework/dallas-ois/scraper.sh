curl http://www.dallaspolice.net/ois/ois.html -s -o data-hold/ois.html
for year in $(seq 2003 2012); do
  filename="ois_$year.html"
  curl "http://www.dallaspolice.net/ois/$filename" -s -o "data-hold/$filename"
done
for pdfname in $(cat data-hold/*.html | pup 'table td:nth-of-type(1) a attr{href}' | grep 'pdf'); do
  filename=$(echo $pdfname | cut -d '/' -f 6)
  curl "http://www.dallaspolice.net/$pdfname" -s -o "data-hold/pdfs/$filename"
done
