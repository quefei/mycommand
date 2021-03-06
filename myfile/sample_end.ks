####
auth --enableshadow --passalgo=sha512


####
url --url="http://###555.555.555.555###/cobbler/ks_mirror/CentOS-7.4-x86_64/"
text

network --bootproto=static --onboot=on --ip=###666.666.666.666### --netmask=255.255.255.0 --gateway=###111.111.111.111### --nameserver=114.114.114.114
network --hostname=quenong


####
timezone Asia/Shanghai --isUtc --nontp
keyboard --vckeymap=us --xlayouts='us' --switch='grp:ctrl_shift_toggle'
lang en_US.UTF-8 --addsupport=zh_CN.UTF-8


####
rootpw --iscrypted $6$voVz0lpw$i1anVDeJYoAzp2BwynwTCdgaUr3Kp/P4G4.umZGYv4Xwzy4N8/gvIDthZqk89NmbLHNUCKLpFepYRpu4yhI9Y1
user --groups=wheel --name=admin --password=$6$voVz0lpw$i1anVDeJYoAzp2BwynwTCdgaUr3Kp/P4G4.umZGYv4Xwzy4N8/gvIDthZqk89NmbLHNUCKLpFepYRpu4yhI9Y1 --iscrypted --gecos="admin"


####
services --disabled="chronyd"

firstboot --disable
selinux --disabled
firewall --enabled


####
bootloader --append=" crashkernel=auto" --location=mbr --boot-drive=sda
clearpart --all --initlabel --drives=sda

part        biosboot      --fstype="biosboot"    --ondisk=sda     --size=2
part        /boot         --fstype="xfs"         --ondisk=sda     --size=1024
part        pv.200        --fstype="lvmpv"       --ondisk=sda     --grow

volgroup    cl            --pesize=4096          pv.200
logvol      swap          --fstype="swap"        --size=2048      --name=swap         --vgname=cl

# 500G, 100g 50g 50g 262.75g
logvol      /             --fstype="xfs"         --size=102400    --name=root         --vgname=cl
logvol      /var          --fstype="xfs"         --size=51200     --name=var          --vgname=cl
logvol      /home         --fstype="xfs"         --size=51200     --name=home         --vgname=cl
logvol      /usr/local    --fstype="xfs"         --size=269057    --name=usr_local    --vgname=cl


####
reboot


####
%packages
@^minimal
@core
kexec-tools
%end


####
%pre
%end

%post
systemctl disable postfix.service

curl -sS https://gitee.com/quefei/quenong/raw/master/install.sh | bash
%end


####
%addon com_redhat_kdump --enable --reserve-mb='auto'
%end

%anaconda
pwpolicy root --minlen=6 --minquality=50 --notstrict --nochanges --notempty
pwpolicy user --minlen=6 --minquality=50 --notstrict --nochanges --notempty
pwpolicy luks --minlen=6 --minquality=50 --notstrict --nochanges --notempty
%end
