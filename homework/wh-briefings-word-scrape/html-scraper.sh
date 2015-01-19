cat data-hold/* | pup '#content p text{}' > data-hold/word-scrape.txt
cat data-hold/* | pup 'div.legacy-para text{}' >> data-hold/word-scrape.txt
tr [[:upper:]] [[:lower:]] < data-hold/word-scrape.txt | \
grep -oE '[[:alpha:]]{7,}' | \
sort | uniq -c | \
sort -rn | head -n 10
rm data-hold/word-scrape.txt
