cd /etc/smartdns
date "+%Y-%m-%d %H:%M:%S" > 1.log
#rm address.conf && 
rm blacklist-ip.conf && rm custom.conf
rm anti-ad-for-smartdns.conf
wget https://gitee.com/privacy-protection-tools/anti-ad/raw/master/anti-ad-for-smartdns.conf && echo -n "  start update anti-ad-for-smartdns.conf " >> 1.log 
rm make-gfwlist.sh && rm gfwlist.conf
wget https://raw.githubusercontent.com/jikkyfu/smartdns/master/make-gfwlist.sh
bash make-gfwlist.sh -d oversea -o gfwlist.conf && echo " +++++  update gfwlist.conf "  >> 1.log
wget https://raw.githubusercontent.com/jikkyfu/smartdns/master/blacklist-ip.conf
wget https://raw.githubusercontent.com/jikkyfu/smartdns/master/custom.conf
sed -ie '/smartdns/d' /var/spool/cron/crontabs/root
echo "0 4 * * * bash /etc/smartdns/update.sh" >> /var/spool/cron/crontabs/root
