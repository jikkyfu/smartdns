cd /etc/smartdns
date "+%Y-%m-%d %H:%M:%S" > 1.log
#rm address.conf && 
rm blacklist-ip.conf && rm custom.conf && rm update.sh
rm anti-ad-for-smartdns.conf
wget https://gitee.com/privacy-protection-tools/anti-ad/raw/master/anti-ad-for-smartdns.conf && echo -n "  start update anti-ad-for-smartdns.conf " >> 1.log 
rm make-gfwlist.sh && rm gfwlist.conf
wget https://raw.githubusercontent.com/jikkyfu/smartdns/master/make-gfwlist.sh
sh make-gfwlist.sh -d oversea -o gfwlist.conf && echo -n " +++++  update gfwlist.conf "  >> 1.log
wget https://raw.githubusercontent.com/jikkyfu/smartdns/master/blacklist-ip.conf
wget https://raw.githubusercontent.com/jikkyfu/smartdns/master/custom.conf
sed -ie '/smartdns/d' /var/spool/cron/crontabs/root
sh ./merge.sh  &&  echo " +++++  update merge-for-smartdns.conf "  >> 1.log
echo "0 4 * * * sh /etc/smartdns/update.sh" >> /var/spool/cron/crontabs/root
