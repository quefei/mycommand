auth --enableshadow --passalgo=sha512
#url --url=$tree
url --url="http://192.168.1.5/cobbler/ks_mirror/Zhongzi-x86_64/"
#graphical
text
keyboard --vckeymap=us --xlayouts='us' --switch='grp:ctrl_shift_toggle'
lang en_US.UTF-8 --addsupport=zh_CN.UTF-8
network --bootproto=dhcp --onboot=on
network --hostname=zhongzi
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
echo '#!/bin/bash
# quenong.com
# qinweijunlin
# 2017-1-10 13:24:40

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:~/bin
########## Defined variable ##########
projectName="zhongzi"

sourceUrl="ftp://120.24.252.165"
downloadDir="/opt"
userName="quenong:NONGque456@"

########## Defined function ##########
rm_quenong()
{
    rm -r $downloadDir/.$projectName
    rm /usr/sbin/quenong

    sed -i '/^quenong/d' /etc/rc.d/rc.local
}

quenong_start()
{
    [ -d $downloadDir/.$projectName ] || mkdir $downloadDir/.$projectName

    until [ -f $downloadDir/.$projectName/$projectName.conf ]
    do
        curl -u $userName -o $downloadDir/.$projectName/$projectName.conf $sourceUrl/$projectName/$projectName.conf
    done

    . $downloadDir/.$projectName/$projectName.conf
    option=$__ID
        case "$option" in
            1)
                rm_quenong; halt -p; exit 0
            ;;

            2)
                rm_quenong; reboot; exit 0
            ;;

            3)
                rm_quenong; exit 0
            ;;

            *)
                sed -i '/^quenong/d' /etc/rc.d/rc.local
            ;;
        esac

    until [ -f $downloadDir/.$projectName/$projectName-latest.tar.gz ]
    do
         curl -u $userName -o $downloadDir/.$projectName/$projectName-latest.tar.gz $sourceUrl/$projectName/$projectName-latest.tar.gz
    done

    cd $downloadDir/.$projectName
    [ -d $projectName ] || tar -xzvf $projectName-latest.tar.gz
    . $downloadDir/.$projectName/$projectName/$projectName.sh
}

########## Main code ##########
if [ "$1" = "install" ]
then
    case "$2" in
        "zhongzi")
            quenong_start
        ;;

        "wenjian")
            quenong_start
        ;;

        "yunwei")
            quenong_start
        ;;

        "beifen")
            quenong_start
        ;;

        *)
            exit 1
        ;;
    esac
else
    exit 1
fi' > /usr/sbin/quenong
chmod 755 /usr/sbin/quenong

echo 'quenong install zhongzi' >> /etc/rc.d/rc.local
chmod 755 /etc/rc.d/rc.local
%end

%addon com_redhat_kdump --enable --reserve-mb='auto'
%end

%anaconda
pwpolicy root --minlen=6 --minquality=50 --notstrict --nochanges --notempty
pwpolicy user --minlen=6 --minquality=50 --notstrict --nochanges --notempty
pwpolicy luks --minlen=6 --minquality=50 --notstrict --nochanges --notempty
%end
