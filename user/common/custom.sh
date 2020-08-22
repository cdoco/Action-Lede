#!/bin/bash

echo "Apply custom.sh"

git clone https://github.com/CCnut/feed-netkeeper.git -b openwrt-18.06                                   package/nk
git clone https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom.git                             package/luci-theme-infinityfreedom
git clone https://github.com/yangsongli/luci-theme-atmaterial.git                                        package/luci-theme-atmaterial
git clone https://github.com/jerrykuku/luci-theme-argon.git -b 18.06                                     package/luci-theme-argon-jerrykuku
git clone https://github.com/tty228/luci-app-serverchan.git                                              package/luci-app-serverchan
git clone https://github.com/vernesong/OpenClash.git -b master                                           package/luci-app-openclash
git clone https://github.com/max0y/luci-app-cd8021x.git -b master                                        package/luci-app-cd8021x
