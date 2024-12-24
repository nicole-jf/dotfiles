#!/bin/fish
function history_expansion
    set argv (echo $argv | sed -r 's/^!!/!1/') # !! as !1

    set -l argument_index (echo $argv | grep -P -o -- '(?<=:)-?\d+(\.\.)?(-?\d+)?')
    set -l command_index (echo $argv | grep -P -o -- '(?<=!)-?\d+')

    # get full command including arguments and store in $list_of_arguments
    if test -z $command_index # if command index is unset, assume to be 1
        set -f list_of_arguments (get_history_item 1 | grep -E -o -- '\S+')
    else 
        set -f list_of_arguments (get_history_item $command_index | grep -E -o -- '\S+')
    end

    if test -z $argument_index
        set -f reponse $list_of_arguments
    else
        set -f reponse (echo $list_of_arguments[$argument_index])
    end

    if test -z (echo $reponse)
        return 1
    else
        echo $reponse
    end
end


# !(
#
# )
# :?(-?\d+\.\.-?\d+|\.\.-?\d+|-?\d+\.\.|-?\d+)?
