https://github.com/pymumu/luci-app-smartdns


./scripts/feeds update -a && ./scripts/feeds install -a
LUCIBRANCH="lede"
make package/feeds/luci/applications/luci-app-smartdns/compile


================ https://github.com/1phalley/smartdnsprocd
OpenWrt上Smartdns的自动守护进程，监控smartdns运行状态，在崩溃时自动重启。
使用方法：
将smartdnsprocd文件放到 /etc/init.d 目录下执行 chmod 755 smartdnsprocd 赋予权限
cd /etc/init.d
wget https://raw.githubusercontent.com/jikkyfu/smartdns/master/smartdnsprocd && chmod 755 smartdnsprocd

开机自启 service smartdnsprocd enable
开始监控 service smartdnsprocd start
停止监控 service smartdnsprocd stop
查看效果：
执行 pgrep smartdns 查看smartdns的进程号
执行 kill -s 9 进程号 杀死进程，此时再快速执行 pgrep smartdns 应该不会有smartdns进程号出现
等待几秒后执行 pgrep smartdns 发现smartdns以新的进程号启动成功

配置文件分两个地方
/etc/config/smartdns
/etc/smartdns/address.conf
/etc/smartdns/blacklist-ip.conf
/etc/smartdns/custom.conf
加载配置位置：
/tmp/etc/smartdns/smartdns.conf
