proxy=http://学校のID:パスワード@プロキシのアドレス:8080/

function set_proxy() {
  export http_proxy=$proxy
  export ftp_proxy=$proxy
  export all_proxy=$proxy
  export https_proxy=$proxy

  git config --global http.proxy $proxy
  git config --global https.proxy $proxy
  git config --global url."https://".insteadOf git://
}

function unset_proxy() {
  unset http_proxy
  unset ftp_proxy
  unset all_proxy
  unset https_proxy

  git config --global --unset http.proxy
  git config --global --unset https.proxy
  git config --global --unset url."https://".insteadOf
}

if [ $1 == "set" ]; then
  echo "🔒 Set Proxy Settings"
  set_proxy
elif [ $1 == "unset" ]; then
  echo "🔓 Unset Proxy Settings"
  unset_proxy
else
  echo "🔓 Unset Proxy Settings"
  unset_proxy
fi
