function _zoxide_hook --on-variable PWD
    zoxide add (pwd -L)
end
