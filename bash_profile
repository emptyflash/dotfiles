source ~/.bash_secrets
source ~/.nvm/nvm.sh

export PATH=$PATH:~/.cabal/bin
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.npm/bin
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin
export GOPATH=~/Go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
export EDITOR=nvim

vnew3() {
    python3 -m venv ~/.virtualenv/$(basename "$(pwd)")
}
vnew2() {
    virtualenv ~/.virtualenv/$(basename "$(pwd)")
}
vsource() {
    source ~/.virtualenv/$(basename "$(pwd)")/bin/activate
}
alias antlr='java -jar /usr/local/lib/antlr-4.7.1-complete.jar'

docker() {
    if [ "$1" = "compose" ]; then
        docker-compose ${@:2}
    else
        /usr/bin/docker $@
    fi
}

kafka_docker() {
    docker run -it --rm confluentinc/cp-kafka bash
}

pyclean() {
    sudo find . -type f -name '*.py[co]' -delete -o -type d -name __pycache__ -delete
}

view_ascii() {
    curl -sL "https://content.jwplatform.com/videos/$1.m4a" > "/tmp/$1.m4a"
    ffplay -nodisp -autoexit "/tmp/$1.m4a" > /dev/null 2>&1 &
    curl -sN "http://ascii.jwplayer.com/ascii/$1.sh?w=$(stty size | cut -f 2 -d " ")&h=$(stty size | cut -f 1 -d " ")" | tr -d '\r' | bash
}

standup_time() {
    day_or_week=`date +%w`
    if [ $day_or_week == 1 ] ; then
      look_back=3
    else
      look_back=1
    fi
    python3 -m webbrowser "https://github.com/pulls?q=archived%3Afalse+created%3A$(date -d "$look_back day ago" +'%Y-%m-%d')+author%3Aemptyflash"
    python3 -m webbrowser "https://jwplayer.atlassian.net/jira/your-work"
}

jwcurl() {
    local headers=(-H 'Content-Type: application/json')
    if [[ "$@" == *"api.jwplayer.com"* ]]; then
        headers+=(-H "Authorization: $JWP_API_TOKEN")
    elif [[ "$@" == *"api-dev.jwplayer.com"* ]]; then
        headers+=(-H "Authorization: $JWP_DEV_API_TOKEN")
    elif [[ "$@" == *"localhost:9676"* ]]; then
        headers+=(-H "Authorization: $JWP_DEV_API_TOKEN")
    else
        headers+=(-H "Authorization: Bearer $(cat ~/.cache/authsvc/session)")
    fi
    curl "${headers[@]}" "$@"
}

stream_file() {
    ffmpeg -v verbose -stream_loop -1 -re -i "$1" -c:a copy -c:v copy -f flv "$2"
}

start_vpn() {
    sudo openvpn --config ~/config.ovpn --auth-user-pass --auth-retry interact
}

if [ -e /home/cameron/.nix-profile/etc/profile.d/nix.sh ]; then . /home/cameron/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
. "$HOME/.cargo/env"

export WINEPREFIX=/media/cameron/Second\ Drive/wine

past_commit() {
    export GIT_COMMITTER_DATE=$(date -d "$1")
    export GIT_AUTHOR_DATE=$(date -d "$1")
    git commit "${@:2}"
}

if [ -d "/media/cameron/SecondDrive/adb-fastboot/platform-tools" ] ; then
 export PATH="/media/cameron/SecondDrive/adb-fastboot/platform-tools:$PATH"
fi

export PATH="$HOME/.tfenv/bin:$PATH"
