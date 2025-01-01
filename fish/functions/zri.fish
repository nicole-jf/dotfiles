function zri
    set -l _zoxide_result (zoxide query -i -- $argv)
    and zoxide remove $_zoxide_result
end
