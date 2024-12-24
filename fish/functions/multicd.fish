function multicd
    echo (string repeat -n (math (string length -- $argv[1]) - 1) ../)
end
