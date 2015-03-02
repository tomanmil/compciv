echo  'case_number | date | location | suspect_status | suspect_weapon | suspects | officers | grand_jury | latitude | longitude | narrative |' > tables/incidents.psv
csvfix echo -ifn -osep '|' ois.csv | while read location_line; do
  pdf=$(echo $location_line | cut  -d '|' -f 1 | cut -d '/' -f 6 | tr -d '\"')
  line=$(echo $location_line | cut -d '|' -f 2- | tr -d '\"')
 loc=$(echo $location_line | cut -d '|' -f 4)
  geo=$(grep "$loc" tables/geocodes.psv | cut -d '|' -f 2,3)
  if [[ -f "data-hold/pdfs/$pdf" ]]; then
  narrative=$(pdftotext "data-hold/pdfs/$pdf" - | tr '[[:space:]]' ' ')
  printf '%s|%s%s|\n' "$line" "$geo" "$narrative" >> tables/incidents.psv
  fi
done
echo 'case_number | date | suspect_killed | suspect_weapon | last_name | first_name | race | gender |' > tables/officers.psv
echo 'case_number | date | suspect_weapon | last_name | first_name |' > tables/suspects.psv
csvfix echo -ifn tables/incidents.psv | while read incident_line; do
  incident_line=$(echo $incident_line | sed 's/\s\+,/,/g')
  cnd=$(echo $incident_line | cut -d '|' -f 1,2 | tr -d '\"')
  weapon=$(echo $incident_line | cut -d '|' -f 5)
  officers=$(echo  $incident_line | cut -d '|' -f 7)
  status=$(echo $incident_line | cut -d '|' -f 4)
  suspects=$(echo $incident_line | cut -d '|' -f 6)
  if [[ "$status" = "Deceased" ]]; then
  killed="TRUE"
  else killed="FALSE"
  fi
  i=0
  for item in $officers; do
  if  [[ i -eq 0 ]]; then
  last_name=$(echo $item | tr -d ',' | tr -d '\"')
  elif [[ $item = *","* ]]; then
  last_name=$(echo "$last_name $item" | tr -d  ',' | tr -d '\"')
  i=$((i-1))
  elif [[ i -eq 1 ]]; then
  first_name=$item
  elif  [[ $item = *"/"* ]]; then
  race=$(echo $item | cut -d '/' -f 1)
  gender=$(echo $item | cut -d '/' -f 2)
  printf "%s|%s|%s|%s|%s|%s|%s|\n" "$cnd" "$killed" "$weapon" "$last_name" "$first_name" "$race" "$gender" >> tables/officers.psv
  else
  first_name="$first_name $item"
  i=$((i-1))
  fi
  i=$(((i+1)%3))
  done
  i=0
  for item in $suspects; do
  if  [[ i -eq 0 ]]; then
  last_name=$(echo $item | tr -d ',' | tr -d '\"')
  elif [[ $item = *","* ]]; then
  last_name=$(echo "$last_name $item" | tr -d  ',' | tr -d '\"')
  i=$((i-1))
  elif [[ i -eq 1 ]]; then
  first_name=$item
  elif  [[ $item = *"/"* ]]; then
  printf "%s|%s|%s|%s|\n" "$cnd" "$weapon" "$last_name" "$first_name" >> tables/suspects.psv
  else
  first_name="$first_name $item"
  i=$((i-1))
  fi
  i=$(((i+1)%3))
  done
done
