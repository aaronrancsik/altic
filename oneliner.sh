#!/usr/bin/env sh

curl --remote-name-all https://raw.githubusercontent.com/aaronrancsik/altic/master/{ali,instructions.txt,setup.sh,step_helper.sh}
chmod +x {setup,step_helper}.sh
./setup.sh