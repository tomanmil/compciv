bash tx-dr.sh | sed 's/.*/TX,&/'
bash fl-dr.sh | sed 's/W/White/' | sed 's/H/Hispanic/' | sed 's/B/Black/' | sed 's/O/Other/' | sed 's/[MF]//' | sed 's/.*/FL,&/'
bash ca-dr.sh | sed 's/WHI/White/' | sed 's/HIS/Hispanic/' | sed 's/BLA/Black/' | sed 's/OTH/Other/' | sed 's/.*/CA,&/'

