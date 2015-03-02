cat data-hold/*.html | pup 'table table tr json{}' |
  jq  --raw-output '.[] .children | [
    .[0] .children[0] .href,
    .[0] .children[0] .text,
    .[1] .text ,
    .[2] .text,
    .[3] .text,
    .[4] .text,
    .[5] .text,
    .[6] .text,
    .[7] .text
  ] | @csv' > ois.csv
mkdir -p 'data-hold/geocodes'
echo 'location|latitude|longitude|' > tables/geocodes.psv
csvfix echo -ifn  -smq ois.csv | cut -d ',' -f 4 | grep -v  'Location' | while read location_line; do
  some_slug=$(echo $location_line | sed s/[^A-z0-9]//g)
  some_filename="data-hold/geocodes/$some_slug.json"
if [[ -s "$some_filename" ]]; then
  echo "Already downloaded $some_filename"
else
  plusloc=$(echo $location_line | tr ' ' '+')
  curl -s "https://maps.googleapis.com/maps/api/geocode/json?address=$plusloc+Dallas+TX" > "$some_filename"
  sleep 1
fi
lat=$(cat $some_filename | jq '.results[0] .geometry .location .lat')
lng=$(cat $some_filename | jq '.results[0] .geometry .location .lng')
loc=$(echo $location_line | tr -d ',')
printf '%s|%s|%s|\n' "$loc" "$lat" "$lng" >> tables/geocodes.psv
done
