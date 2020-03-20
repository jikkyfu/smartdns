cd /etc/smartdns
date "+%Y-%m-%d %H:%M:%S"  > 1.log 
rm anti-ad-for-smartdns.conf
wget https://gitee.com/privacy-protection-tools/anti-ad/raw/master/anti-ad-for-smartdns.conf && echo -n "start update anti-ad-for-smartdns.conf " >> 1.log 
rm make-gfwlist.sh && rm gfwlist.conf
wget https://raw.githubusercontent.com/peaceshi/smartdns-wsl/master/script/make-gfwlist.sh
     https://github.com/jikkyfu/smartdns-make-gfwlist/blob/master/make-gfwlist.sh
bash make-gfwlist.sh -d oversea -o gfwlist.conf && echo " +++++  update gfwlist.conf "  >> 1.log
