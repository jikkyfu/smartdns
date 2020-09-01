rm latest
wget https://github.com/pymumu/smartdns/releases/latest
url=`cat latest |grep -m1  /pymumu/smartdns/commit/ |awk -F 'commit/' '{print $2}' |awk  -F '"' '{print $1}'`
version=`cat latest |grep -m1  x86_64-openwrt-all.ipk |awk -F 'smartdns.' '{print $3}' |awk  -F '.x86' '{print $1}'|awk  -F '-' '{print $1}'`
release=`cat latest |grep -m1  x86_64-openwrt-all.ipk |awk -F 'smartdns.' '{print $3}' |awk  -F '.x86' '{print $1}'|awk  -F '-' '{print $2}'`
echo $url
echo $version
echo $release

sed -ri "s/(PKG_VERSION:=)[^=]*/\1$version/" Makefile
sed -ri "s/(PKG_RELEASE:=)[^=]*/\1$release/" Makefile
sed -ri "s/(PKG_SOURCE_VERSION:=)[^=]*/\1$url/" Makefile
