#!/bin/bash
cd /home/runner/immortalwrt
pushd package
#强制关机插件
git clone https://github.com/esirplayground/luci-app-poweroff
#自动关机插件
git clone https://github.com/sirpdboy/luci-app-autopoweroff
#腾讯ddns
git clone https://github.com/Tencent-Cloud-Plugins/tencentcloud-openwrt-plugin-ddns
pushd tencentcloud-openwrt-plugin-ddns/tencentcloud_ddns/files/luci/controller && popd
popd
# Enter your commands here, e.g.
# echo "Start build!"
make defconfig
