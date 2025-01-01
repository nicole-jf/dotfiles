function zi
    set -l _zoxide_result (zoxide query -i -- $argv)
    and _z_cd $_zoxide_result
end
