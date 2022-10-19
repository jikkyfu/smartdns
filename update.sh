rm latest
#wget https://github.com/pymumu/smartdns/releases/latest
#url=`cat latest |grep -m1  /pymumu/smartdns/commit/ |awk -F 'commit/' '{print $2}' |awk  -F '"' '{print $1}'`
#version=`cat latest |grep -m1  x86_64-openwrt-all.ipk |awk -F 'smartdns.' '{print $3}' |awk  -F '.x86' '{print $1}'|awk  -F '-' '{print $1}'`
#release=`cat latest |grep -m1  x86_64-openwrt-all.ipk |awk -F 'smartdns.' '{print $3}' |awk  -F '.x86' '{print $1}'|awk  -F '-' '{print $2}'`

wget https://raw.githubusercontent.com/pymumu/openwrt-smartdns/master/Makefile -O latest
PKG_VERSION=`cat latest |grep PKG_VERSION:|awk  -F '=' '{print $2}'`
PKG_SOURCE_VERSION=`cat latest |grep PKG_SOURCE_VERSION|awk  -F '=' '{print $2}'`
PKG_MIRROR_HASH=`cat latest |grep PKG_MIRROR_HASH|awk  -F '=' '{print $2}'`

echo $PKG_VERSION
echo $PKG_SOURCE_VERSION
echo $PKG_MIRROR_HASH

sed -ri "s/(PKG_VERSION:=)[^=]*/\1$PKG_VERSION/" Makefile
#sed -ri "s/(PKG_RELEASE:=)[^=]*/\1$release/" Makefile
sed -ri "s/(PKG_SOURCE_VERSION:=)[^=]*/\1$PKG_SOURCE_VERSION/" Makefile
sed -ri "s/(PKG_MIRROR_HASH:=)[^=]*/\1$PKG_MIRROR_HASH/" Makefile
