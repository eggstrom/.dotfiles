#!/usr/bin/env bash

cmd="feh --no-fehbg $*"
eval "$cmd"

cat <<- EOF > "$XDG_STATE_HOME/fehbg"
    #!/usr/bin/env bash
    $cmd
EOF

chmod u+x "$XDG_STATE_HOME/fehbg"
