if begin status --is-login; or echo "$PATH" | grep -qv "go/"; end
    set PATH $PATH /usr/local/go/bin $HOME/go/bin
    set -xg GOPATH "$HOME/go"
end

set PATH $PATH $HOME/bin