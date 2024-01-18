#!/usr/bin/env bash

WORKDIR=/photoprism/cron
SCRIPT=$WORKDIR/index.sh

shebang="#!/usr/bin/env bash";
env=$(printenv | grep -v 'PHOTOPRISM_AUTO_INDEX_CRON' | sed 's/^\(.*\)$/export \1/g' | grep -E '^export PHOTOPRISM' | awk '{ printf("%s;\\n", $0) }')
run="/photoprism/bin/photoprism index";

generated=$shebang$"\n\n"$env$"\n\n"$run;
echo -e $generated > $SCRIPT
chmod +x $SCRIPT
