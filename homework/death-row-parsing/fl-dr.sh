cat data-hold/fldr.html | pup 'td:nth-of-type(3) text{}' | grep -oE '[[:upper:]]{2}'
cat data-hold/floldr.html | pup 'td:nth-of-type(3) text{}' | grep -oE '[[:upper:]]{2}'
cat data-hold/flpresdr.html | pup 'td:nth-of-type(3) text{}' | grep -oE '[[:upper:]]{2}'
