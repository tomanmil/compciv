username=$1
mkdir -p ./data-hold
echo "Fetching tweets for $username into ./data-hold/$username-timeline.csv"
file=data-hold/$username-timeline.csv
t timeline -n 3200 --csv $username > $file
count=$(csvfix order -f 1 $file | wc -l)
lastdate=$(csvfix order -fn 'Posted at' $file | tail -n 1)
echo "Analyzing $count tweets by $username since $lastdate"
echo "Top 10 hashtags by $username"
csvfix order -fn Text ./data-hold/$username-timeline.csv | grep -oE '#[[:alnum:]]+' | tr [[:upper:]] [[:lower:]] | sort | uniq -c | sort -rn | head -n 10
echo "Top 10 retweeted users by $username"
csvfix order -fn Text ./data-hold/$username-timeline.csv | grep -oE 'RT @[^ ]+\b' | sed 's/RT //' |  tr [[:upper:]] [[:lower:]] | sort | uniq -c | sort -rn | head -n 10
echo "Top 10 mentioned users not including retweets) by $username"
csvfix order -fn Text ./data-hold/$username-timeline.csv | grep -v 'RT @' | grep -v "@$username" | grep -oE '@[^ ]+\b' | tr [[:upper:]] [[:lower:]] | sort | uniq -c | sort -rn | head -n 10
echo "Top tweeted 10 words with 5+ letters by $username"
csvfix order -fn Text ./data-hold/$username-timeline.csv | sed -E 's/@[^ ]+\b//g' | sed -E 's/#[^ ]+\b//g' | grep  -oiE '\b[^ ]{5,}\b' | grep -v 'http' | tr [[:upper:]] [[:lower:]] | sort | uniq -c | sort -rn | head -n 10
