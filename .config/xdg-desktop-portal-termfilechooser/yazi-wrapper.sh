#!/nix/store/q7sqwn7i6w2b67adw0bmix29pxg85x3w-bash-5.3p3/bin/sh
# This wrapper script is invoked by xdg-desktop-portal-termfilechooser.
#
# For more information about input/output arguments read `xdg-desktop-portal-termfilechooser(5)`

# TODO update the xdg-package and check if this is still necessary, given the developer noted that they found the change in the way ghostty interacts with escaping characters.

set -e

if [ "$6" -ge 4 ]; then
    set -x
fi

multiple="$1"
directory="$2"
save="$3"
path="$4"
out="$5"

cmd="yazi"
termcmd="${TERMCMD:-kitty --title 'termfilechooser'}"

if [ "$save" = "1" ]; then
    # save a file
    set -- --chooser-file="$out" "$path"
elif [ "$directory" = "1" ]; then
    # upload files from a directory
    set -- --chooser-file="$out" --cwd-file="$out"".1" "$path"
elif [ "$multiple" = "1" ]; then
    # upload multiple files
    set -- --chooser-file="$out" "$path"
else
    # upload only 1 file
    set -- --chooser-file="$out" "$path"
fi

command="$termcmd $cmd"
for arg in "$@"; do
    # escape double quotes
    escaped=$(printf "%s" "$arg" | sed 's/"/\\"/g')
    # escape special
	command="$command \"$escaped\""
done

sh -c "$command"

if [ "$directory" = "1" ] &&
    [ ! -s "$out" ] &&
    [ -s "$out"".1" ];
then
    cat "$out"".1" > "$out"
    rm "$out"".1"
fi
