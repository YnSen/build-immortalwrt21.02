#!/bin/bash
cd /home/runner/immortalwrt
pushd package
#强制关机插件
git clone https://github.com/esirplayground/luci-app-poweroff
#自动关机插件
git clone https://github.com/sirpdboy/luci-app-autopoweroff
#腾讯ddns
git clone https://github.com/Tencent-Cloud-Plugins/tencentcloud-openwrt-plugin-ddns
pushd tencentcloud-openwrt-plugin-ddns/tencentcloud_ddns/files/luci/controller
sed -i 's/"admin", "tencentcloud"/"admin", "network", "tencentcloud"/g' tencentddns.lua
popd
popd
# Modify default IP
sed -i 's/192.168.1.1/192.168.3.1/g' package/base-files/files/bin/config_generate
sed -i 's/bootstrap/argon/g' feeds/luci/collections/luci/Makefile
# Enter your commands here, e.g.
# echo "Start build!"
make defconfig
make download -j8 V=s
