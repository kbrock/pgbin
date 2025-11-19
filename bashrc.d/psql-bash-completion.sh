function _psql_database_complete {
  COMPREPLY=($(compgen -W "$(psql -l | awk -F\| '/\|/ {print $1}')" -- ${COMP_WORDS[COMP_CWORD]}))
  return 0
}

function _psqlcomplete {
  local cur prev opts
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"

  #compgen
  # -f          : file
  # -A hostname : hostname
  #  a alias b builtin c command d directory e export [variable]
  #  f file  g group   j job     k keyword   u user v variable
  # ? -s

  # default to postgres user
  if [ ${prev} = -U ] ; then
    COMPREPLY=( $(compgen -W "postgres" $PGUSER -- ${cur}) )
    return 0
  fi

  if [ ${prev} = -H ] ; then
    COMPREPLY=( $(compgen -W "localhost" $PGHOST -- ${cur}) )
    return 0
  fi

  _psql_database_complete
  return 0
}

# check if psql already has completion - only install if it is not installed

if ! complete -p | grep -q '\bpsql\b' ; then
  # not 100%, but close
  complete -o default -o nospace -F _psqlcomplete psql
fi
complete -o default -o nospace -F _psqlcomplete dropdb
complete -o default -o nospace -F _psqlcomplete createdb
complete -o default -o nospace -F _psql_database_complete ptop
complete -o default -o nospace -F _psql_database_complete pmv
complete -o default -o nospace -F _psql_database_complete pdu
complete -o default -o nospace -F _psql_database_complete pcp
# sorry, snuck an external one in here
complete -o default -o nospace -F _psql_database_complete gitdb
