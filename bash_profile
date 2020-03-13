source ~/.bash_secrets
source ~/.aws/jwp-scripts/aws.sh
JWP_AWS_SCRIPT=~/.aws/jwp-scripts/aws.sh

export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.npm/bin
export GOROOT=/usr/local/go-1.11
export PATH=$PATH:$GOROOT/bin
export GOPATH=~/Go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
export npm_config_prefix=~/.npm
export EDITOR=nvim

vnew3() {
    python3.7 -m venv ~/.virtualenv/$(basename $(pwd))
}
vnew2() {
    virtualenv ~/.virtualenv/$(basename $(pwd))
}
vsource() {
    source ~/.virtualenv/$(basename $(pwd))/bin/activate
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
    docker run -i --rm confluentinc/cp-kafka "$@"
}

pyclean() {
    find . -type f -name '*.py[co]' -delete -o -type d -name __pycache__ -delete
}

view_ascii() {
    curl -sL "https://content.jwplatform.com/videos/$1-eP1tovtM.m4a" > "/tmp/$1.m4a"
    curl -sN "http://ascii.jwplayer.com/ascii/$1.sh?w=$(stty size | cut -f 2 -d " ")&h=$(stty size | cut -f 1 -d " ")" | tr -d '\r' | ( echo "ffplay -nodisp -autoexit "/tmp/$1.m4a" >/dev/null 2>&1 &"; cat ) | bash
}

start_vpn() {
    sudo openvpn --config ~/client.ovpn &
    sudo echo "nameserver 8.8.8.8" >> /etc/resolv.conf
    fg
}
