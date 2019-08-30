# CommandNotFound
if [[ -x /usr/lib/command-not-found ]] ; then
  if (( ! ${+functions[command_not_found_handler]} )) ; then
    function command_not_found_handler {
      [[ -x /usr/lib/command-not-found ]] || return 1
      /usr/lib/command-not-found -- ${1+"$1"}
    }
  fi
fi
