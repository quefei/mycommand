auth --enableshadow --passalgo=sha512
url --url="http://192.168.1.5/cobbler/ks_mirror/CentOS-7.3-x86_64/"
#graphical
text
keyboard --vckeymap=us --xlayouts='us' --switch='grp:ctrl_shift_toggle'
lang en_US.UTF-8 --addsupport=zh_CN.UTF-8
#network --bootproto=dhcp --onboot=on
network --bootproto=static --onboot=on --ip=192.168.1.6 --netmask=255.255.255.0 --gateway=192.168.1.1 --nameserver=202.103.225.68
#network --hostname=localhost.localdomain
network --hostname=laravel
services --disabled="chronyd"
timezone Asia/Shanghai --nontp
rootpw --iscrypted $6$voVz0lpw$i1anVDeJYoAzp2BwynwTCdgaUr3Kp/P4G4.umZGYv4Xwzy4N8/gvIDthZqk89NmbLHNUCKLpFepYRpu4yhI9Y1
user --groups=wheel --name=admin --password=$6$voVz0lpw$i1anVDeJYoAzp2BwynwTCdgaUr3Kp/P4G4.umZGYv4Xwzy4N8/gvIDthZqk89NmbLHNUCKLpFepYRpu4yhI9Y1 --iscrypted --gecos="admin"
bootloader --append=" crashkernel=auto" --location=mbr
clearpart --all --initlabel
part biosboot --fstype="biosboot" --ondisk=sda --size=2
part /boot --fstype="xfs" --ondisk=sda --size=1024
part pv.613 --fstype="lvmpv" --ondisk=sda --size=475913
volgroup cl --pesize=4096 pv.613
logvol /var  --fstype="xfs" --size=51200 --name=var --vgname=cl
logvol /usr/local  --fstype="xfs" --size=269057 --name=usr_local --vgname=cl
logvol swap  --fstype="swap" --size=2048 --name=swap --vgname=cl
logvol /  --fstype="xfs" --size=102400 --name=root --vgname=cl
logvol /home  --fstype="xfs" --size=51200 --name=home --vgname=cl
firstboot --disable
selinux --disabled
firewall --enabled
reboot

%packages
@^minimal
@core
kexec-tools
%end

%pre
%end

%post
%end

%addon com_redhat_kdump --enable --reserve-mb='auto'
%end

%anaconda
pwpolicy root --minlen=6 --minquality=50 --notstrict --nochanges --notempty
pwpolicy user --minlen=6 --minquality=50 --notstrict --nochanges --notempty
pwpolicy luks --minlen=6 --minquality=50 --notstrict --nochanges --notempty
%end
