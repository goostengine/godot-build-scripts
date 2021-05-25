set -o xtrace

if [ -f /etc/selinux/config ]; then
  setenforce 0
fi

systemctl stop systemd-binfmt
bash -c 'echo ":windows:M::MZ::/usr/bin/wine:" > /proc/sys/fs/binfmt_misc/register'
bash -c 'echo ":windowsPE:M::PE::/usr/bin/wine:" > /proc/sys/fs/binfmt_misc/register'
systemctl start systemd-binfmt
