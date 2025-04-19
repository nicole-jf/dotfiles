#!/bin/fish
#function history_expansion
#    set argv (echo $argv | sed -r 's/^!!/!1/') # !! as !1
#
#    set -l argument_index (echo $argv | grep -P -o -- '(?<=:)-?\d+(\.\.)?(-?\d+)?')
#    set -l command_index (echo $argv | grep -P -o -- '(?<=!)-?\d+')
#
#    # get full command including arguments and store in $list_of_arguments
#    if test -z $command_index # if command index is unset, assume to be 1
#        set -f list_of_arguments (get_history_item 1 | grep -E -o -- '\S+')
#    else 
#        set -f list_of_arguments (get_history_item $command_index | grep -E -o -- '\S+')
#    end
#
#    if test -z $argument_index
#        set -f reponse $list_of_arguments
#    else
#        set -f reponse (echo $list_of_arguments[$argument_index])
#    end
#
#    if test -z (echo $reponse)
#        return 1
#    else
#        echo $reponse
#    end
#end

#function get_list_of_arguments
#    for character in (string split '' (get_history_item $command_index))
#        echo $character
#    end
#end


function history_abbreviation
    set --local indexes ($HOME/.local/bin/parser decode $argv)
    set --local item (get_history_item $indexes[1])
    set --local args ($HOME/.local/bin/parser parse $indexes[2] $indexes[3] $item)
    echo -e "indexes: $indexes\nindexes[2]: $indexes[2]\nindexes[3]: $indexes[3]\nitem: $item\nargs: $args" > /tmp/log
    if test -z "$args"
        return 1
    else
        echo $args
    end
end

