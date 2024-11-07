# Common constants for kidtimer executables

dbdir="/var/local/kidtimer"
#dbdir="./kidtimer"
configdir="$dbdir"
dbdir_local="$dbdir.local"

# Common functions for kidtimer executables

has_file_been_touched_in_the_last_n_seconds () {
        local p_filename="$1"
        local p_seconds="$2"

        [ -e "$p_filename" ] &&	\
                [			\
                        $(( $(date +%s) - $(stat -c "%Y" "$p_filename") )) -lt \
			"$p_seconds"	\
                ]
}

visiting_blacklisted_site_flag_filename () {
   local p_username="$1"

   echo "$dbdir_local/$p_username.vbsf"
}

is_visiting_blacklisted_site () {
   local p_username="$1"

   has_file_been_touched_in_the_last_n_seconds	\
      "$(visiting_blacklisted_site_flag_filename "$p_username")" 60
}

set_visiting_blacklisted_site_flag () {
   local p_username="$1"

   # The flag is set when it is "fresh enough".
   touch "$(visiting_blacklisted_site_flag_filename "$p_username")"
}

reset_visiting_blacklisted_site_flag () {
   local p_username="$1"

   local v_flag_filename="$(visiting_blacklisted_site_flag_filename "$p_username")"
#   if [ ! -e "$v_flag_filename" ]; then
#      if [ "$(stat -c "%u" "$v_flag_filename")" != "0" ]; then
#	 rm "$v_flag_filename"
#      fi
#      touch "$v_flag_filename"
#      setfacl -m user:"$p_username":w "$v_flag_filename"
#   fi
#   touch -d "-2 hours" "$v_flag_filename"
   rm --interactive=never "$v_flag_filename" 2>/dev/null
   touch -d "-2 hours" "$v_flag_filename"
      # If the file is owned by root, it will work only as root. (The user can
      # not reset the flag.) reset_...() will only be called from go_daily()
      # and go_check() that are to be run by root.
   setfacl -m user:"$p_username":w "$v_flag_filename"
}

is_user_set_up () {
   local p_username="$1"

   grep -q "^$p_username" "$configdir/kid.list"
}
