pdftotext data-hold/cadr.pdf
grep -oE '\b[[:upper:]]{3}\b' data-hold/cadr.txt | grep -oE "WHI|BLA|HIS|OTH"
