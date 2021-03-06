#!/bin/sh
export PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

echo ""
echo "安装Socks5所依赖的组件,请稍等..."
yum -y install gcc gcc-c++ automake make pam-devel openldap-devel cyrus-sasl-devel openssl-devel

echo ""
echo "下载Socks5服务中..."
#wget https://sourceforge.net/projects/ss5/files/ss5/3.8.9-8/ss5-3.8.9-8.tar.gz

wget -q -N --no-check-certificate https://raw.githubusercontent.com/wyx176/Socks5/master/ss5-3.8.9-8.tar.gz
wget -q -N --no-check-certificate https://raw.githubusercontent.com/wyx176/Socks5/master/ss5.tar.gz
mv ss5.tar.gz /etc/opt/ss5/

echo ""
echo "解压文件中..."
tar zxvf ./ss5-3.8.9-8.tar.gz

echo ""
rm ss5-3.8.9-8.tar.gz
echo "安装中1..."
cd ss5-3.8.9

ls

echo "安装中2..."
./configure

echo "安装中3..."
make

echo "安装中4..."
make install

cd /etc/opt/ss5/
tar -xzvf ss5.tar.gz
rm ss5.tar.gz

echo "开机启动添加成功"
chmod +x /etc/init.d/ss5
chkconfig --add ss5
chkconfig --level 345 ss5 on

cd /root
rm install.sh

service ss5 start

echo ""
echo "Socks5安装成功！"

echo ""
echo "默认用户名123456"
echo "默认密码654321"
echo "默认端口1080"
echo ""
echo "请按照文档进行配置！"

echo ""

