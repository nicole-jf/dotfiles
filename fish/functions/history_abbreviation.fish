function history_abbreviation
    set --local indexes ($HOME/.local/bin/parser decode $argv)
    set --local item (get_history_item $indexes[1])
    set --local args ($HOME/.local/bin/parser parse $indexes[2] $indexes[3] $item)
    if test -z "$args"
        return 1
    else
        echo $args
    end
end

