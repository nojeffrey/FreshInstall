export WORKON_HOME=$HOME/.virtualenvs 
source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
alias ta='tmux a -t'
alias tn='tmux new -s'
alias notebook="ipython notebook --pylab inline"
alias putty-commandline="minicom"
alias networkminer='mono /opt/networkminer/NetworkMiner.exe'
alias burpsuite='java -jar -Xmx1024m /opt/burpsuite/burpsuite_free_v1.6.30.jar'
alias googlerank="python /home/scottie/pythonshit/costcalc/googleranking.py"
alias n='nemo &'
alias image='eog'
alias e='emacs -nw'
alias scrot_to_imgur='scrot -s /tmp/blah.png -e /home/scottie/pythonshit/imguruploaded/start.py'

#geoip lookup (doesn't work anymore)
function geoip_curl_xml { curl -D - http://freegeoip.net/xml/$1; }
alias geoip=geoip_curl_xml

function tarEncrypt() {
if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ];then
echo -e "Wrong arguments. Script usage:\n" \
"   tarEncrypt source-folder dest-encrypted-file-name password\n" \
"   Example: tarEncrypt ./MyFolder myFolder-1-1-1970.encrypted MySecretPasword\n"
else
    tar zcvf - $1 | openssl des3 -salt -k $3 | dd of=$2;
    echo "The file $2 is created!"
fi
}

function untarDecrypt() {
if [ -z "$1" ] || [ -z "$2" ];then
echo -e "Wrong arguments. Script usage:\n" \
"   untarDecrypt source-encrypted-file password"

else
dd if=$1 | openssl des3 -d -salt -k $2 | tar xzf -
if [ $? -eq 0 ]; then
echo -e "\nThe file $1 was extracted successfully.\n"

else
echo -e "\nError while decrypting. Probably the given password is wrong.\n"
fi
fi
}


#random git commit
rgc() {
    git commit -m"`curl -s http://whatthecommit.com/index.txt`"
}

function mcd() {
  mkdir -p "$1" && cd "$1";
}


function bytestoKB() { python -c "print str($1/1024.00) + ' KB'"; }
function bytestoMB() { python -c "print str($1/1024/1024.00) + ' MB'"; }
function bytestoGB() { python -c "print str($1/1024/1024/1024.00) + ' GB'"; }
function bytestoTB() { python -c "print str($1/1024/1024/1024/1024.00) + ' TB'"; }

export HISTSIZE=5000
HISTCONTROL=ignorespace

export TERM=xterm-256color
