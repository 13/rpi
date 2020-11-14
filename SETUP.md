### 2.1. Termite Backspace fix

```bash
pacman -S termite-terminfo
```

### 2.2. German keyboard layout

```bash
loadkeys de
echo LANG=en_US.UTF-8 > /etc/locale.conf
echo KEYMAP=de-latin1-nodeadkeys > /etc/vconsole.conf
sed -i "s/#en_US.UTF-8/en_US.UTF-8/" /etc/locale.gen
locale-gen
```
### 2.3. Set timezone & NTP

```bash
ln -sf /usr/share/zoneinfo/Europe/Rome /etc/localtime
timedatectl set-ntp true
```

### 2.3.1. fake-hwclock

```bash
pacman -S fake-hwclock
systemctl enable fake-hwclock
systemctl start fake-hwclock
```
