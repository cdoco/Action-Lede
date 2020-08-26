#!/bin/bash

echo "Test custom.sh"

sed -i 's/DEPENDS.*/& \+luci-i18n-samba-zh-cn/g'                                package/lean/autosamba/Makefile

sed -i "2i # network config"                                                    package/lean/default-settings/files/zzz-default-settings
sed -i "3i uci set network.lan.ipaddr='192.168.2.1'"                            package/lean/default-settings/files/zzz-default-settings
sed -i "4i uci set network.lan.proto='static'"                                  package/lean/default-settings/files/zzz-default-settings
sed -i "5i uci set network.lan.type='bridge'"                                   package/lean/default-settings/files/zzz-default-settings
sed -i "6i uci set network.lan.ifname='eth0'"                                   package/lean/default-settings/files/zzz-default-settings
sed -i "7i uci set network.lan.netmask='255.255.255.0'"                         package/lean/default-settings/files/zzz-default-settings
sed -i "10i uci commit network\n"                                               package/lean/default-settings/files/zzz-default-settings

rm -rf package/lean/luci-theme-argon
git clone https://github.com/destan19/OpenAppFilter.git                                                  package/oaf
svn co https://github.com/Lienol/openwrt/trunk/package/diy/luci-app-adguardhome                          package/adg
svn co https://github.com/Lienol/openwrt-luci/trunk/applications/luci-app-smartdns                       package/luci-app-smartdns
