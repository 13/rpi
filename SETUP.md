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

### 2.4. Set hostname

```bash
hostnamectl set-hostname p4
```

### 2.5. Set a secure root passwd

```bash
passwd
```

### 2.6. sudo & new user

```bash
pacman -S sudo
```

* Uncomment and add:

```bash
%wheel ALL=(ALL) ALL
ben ALL=(ALL) NOPASSWD: ALL
```

* Add a new user

```bash
useradd -d /home/yourUserName -m -G wheel -s /bin/bash ben
```

* Set a password for your new user:

```bash
passwd ben
```

### 2.6.1 Delete default user alarm

```bash
sudo userdel alarm
```
