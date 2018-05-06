# copied from github.com/davidbstein/color_functions.bash

function echo_black {
  echo -e "\033[0;30m${@:1}\033[0m"
}
function echo_darkgray {
  echo -e "\033[1;30m${@:1}\033[0m"
}
function echo_red {
  echo -e "\033[0;31m${@:1}\033[0m"
}
function echo_lightred {
  echo -e "\033[1;31m${@:1}\033[0m"
}
function echo_green {
  echo -e "\033[0;32m${@:1}\033[0m"
}
function echo_lightgreen {
  echo -e "\033[1;32m${@:1}\033[0m"
}
function echo_brown {
  echo -e "\033[0;33m${@:1}\033[0m"
}
function echo_yellow {
  echo -e "\033[1;33m${@:1}\033[0m"
}
function echo_blue {
  echo -e "\033[0;34m${@:1}\033[0m"
}
function echo_lightblue {
  echo -e "\033[1;34m${@:1}\033[0m"
}
function echo_purple {
  echo -e "\033[0;35m${@:1}\033[0m"
}
function echo_lightpurple {
  echo -e "\033[1;35m${@:1}\033[0m"
}
function echo_cyan {
  echo -e "\033[0;36m${@:1}\033[0m"
}
function echo_lightcyan {
  echo -e "\033[1;36m${@:1}\033[0m"
}
function echo_lightgray {
  echo -e "\033[0;37m${@:1}\033[0m"
}
function echo_white {
  echo -e "\033[1;37m${@:1}\033[0m"
}

