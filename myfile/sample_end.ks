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
timezone Asia/Shanghai --isUtc --nontp
rootpw --iscrypted $6$xAOdDuvJJSLtMxiC$ycQ/Kur8atuCcq3TDMJUs2I/MFHItv0iVTmx8Di.jHsUc3yIaXbeSOh0QjR1On77Uq8V5qSC6x2md59TbFZ0d1
user --groups=wheel --name=quenong --password=$6$Qki9FK8NxZPriJpc$w6Pm3IzXfSvFVctkDKauiCvMV1U3eMtgKe8H3kmbMNqy5S1NH43YZ7fnEfDTc3BxpI/SnF7locLxcebjQiYnl1 --iscrypted --gecos="quenong"
bootloader --append=" crashkernel=auto" --location=mbr
clearpart --all --initlabel
part pv.628 --fstype="lvmpv" --size=475913
part biosboot --fstype="biosboot" --size=2
part /boot --fstype="xfs" --size=1024
volgroup cl --pesize=4096 pv.628
logvol /  --fstype="xfs" --size=51200 --name=root --vgname=cl
logvol swap  --fstype="swap" --size=2048 --name=swap --vgname=cl
logvol /var  --fstype="xfs" --size=371457 --name=var --vgname=cl
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
