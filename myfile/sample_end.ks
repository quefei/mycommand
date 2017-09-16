# 系统的授权信息
auth --enableshadow --passalgo=sha512

# 安装类型
harddrive --partition=sdb1 --dir=/
#url --url="http://###555.555.555.555###/cobbler/ks_mirror/CentOS-7.4-x86_64/"

# 安装模式
text
#graphical

# 键盘
keyboard --vckeymap=us --xlayouts='us' --switch='grp:ctrl_shift_toggle'

# 语言
lang en_US.UTF-8 --addsupport=zh_CN.UTF-8

# 网络
#network --bootproto=dhcp --onboot=on
#network --bootproto=static --onboot=on --ip=###666.666.666.666### --netmask=255.255.255.0 --gateway=###111.111.111.111### --nameserver=114.114.114.114
network --bootproto=static --onboot=on --ip=192.168.8.8 --netmask=255.255.255.0 --gateway=192.168.8.2 --nameserver=114.114.114.114
network --hostname=laravel
#network --hostname=localhost.localdomain

# 系统服务
services --disabled="chronyd"

# 时区
timezone Asia/Shanghai --isUtc --nontp

# root 密码
rootpw --iscrypted $6$voVz0lpw$i1anVDeJYoAzp2BwynwTCdgaUr3Kp/P4G4.umZGYv4Xwzy4N8/gvIDthZqk89NmbLHNUCKLpFepYRpu4yhI9Y1

# admin 用户
user --groups=wheel --name=admin --password=$6$voVz0lpw$i1anVDeJYoAzp2BwynwTCdgaUr3Kp/P4G4.umZGYv4Xwzy4N8/gvIDthZqk89NmbLHNUCKLpFepYRpu4yhI9Y1 --iscrypted --gecos="admin"

# 引导程序
bootloader --append=" crashkernel=auto" --location=mbr --boot-drive=sda

# 删除分区
clearpart --all --initlabel --drives=sda

# 创建分区
part        biosboot      --fstype="biosboot"    --ondisk=sda     --size=2
part        /boot         --fstype="xfs"         --ondisk=sda     --size=1024
part        pv.100        --fstype="lvmpv"       --ondisk=sda     --grow

volgroup    cl            --pesize=4096          pv.100
logvol      swap          --fstype="swap"        --size=2048      --name=swap         --vgname=cl

# 500G, 100g 50g 50g 262.75g
logvol      /             --fstype="xfs"         --size=102400    --name=root         --vgname=cl
logvol      /var          --fstype="xfs"         --size=51200     --name=var          --vgname=cl
logvol      /home         --fstype="xfs"         --size=51200     --name=home         --vgname=cl
logvol      /usr/local    --fstype="xfs"         --size=269057    --name=usr_local    --vgname=cl

# 禁用设置代理
firstboot --disable

# 禁用 SELinux
selinux --disabled

# 开启防火墙
firewall --enabled

# 重启/关机
reboot
#poweroff



%packages
@^minimal
@core
kexec-tools
%end



%pre
%end

%post
cat > /usr/local/bin/quenong-download <<-"EOF"
#!/bin/bash

curl -sS http://git.oschina.net/quefei/mycommand/raw/master/install.sh | bash

EOF

chmod 755 /usr/local/bin/quenong-download
%end



%addon com_redhat_kdump --enable --reserve-mb='auto'
%end

%anaconda
pwpolicy root --minlen=6 --minquality=50 --notstrict --nochanges --notempty
pwpolicy user --minlen=6 --minquality=50 --notstrict --nochanges --notempty
pwpolicy luks --minlen=6 --minquality=50 --notstrict --nochanges --notempty
%end
