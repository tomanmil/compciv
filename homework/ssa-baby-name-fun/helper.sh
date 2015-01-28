mkdir -p data-hold
cd data-hold
mkdir -p names-by-state
mkdir -p names-nationwide
cd names-by-state
curl -o namesbystate.zip http://stash.compciv.org/ssa_baby_names/namesbystate.zip
unzip namesbystate.zip
cd ..
cd names-nationwide
curl -o names-nationwide.zip http://stash.compciv.org/ssa_baby_names/names.zip
unzip names-nationwide.zip
cd ..
