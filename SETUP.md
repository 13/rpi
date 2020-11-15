
## 2. Basic system setup

### 2.1. Termite Backspace fix

```bash
pacman -S termite-terminfo
```

### 2.2. German keyboard layout

```bash
loadkeys de
echo KEYMAP=de-latin1-nodeadkeys > /etc/vconsole.conf
echo LANG=en_GB.UTF-8 > /etc/locale.conf
sed -i "s/#de_DE.UTF-8/de_DE.UTF-8/" /etc/locale.gen
sed -i "s/#en_US.UTF-8/en_US.UTF-8/" /etc/locale.gen
sed -i "s/#en_GB.UTF-8/en_GB.UTF-8/" /etc/locale.gen
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
systemctl enable fake-hwclock fake-hwclock-save.timer // disable if RTC
systemctl start fake-hwclock
```

### 2.4. Set hostname

```bash
pacman -S inetutils
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
useradd -m -G users,wheel,power,tty,video,audio,storage,uucp,docker -s /bin/bash ben
```

* Set a password for your new user:

```bash
passwd ben
```

### 2.6.1 Delete default user alarm

```bash
sudo userdel alarm
```

## Tweaks
### fsck & disable ipv6

* Add to /boot/cmdline.txt

```bash
vi /boot/cmdline.txt
ipv6.disable_ipv6=1 fsck.mode=force fsck.repair=yes
```

## 3. Advanced setup
### 3.1. Tmux

```bash
pacman -S tmux
```

* Create `vi /etc/systemd/system/tmux\@.service`
```bash
[Unit]
Description=Start tmux in detached session

[Service]
Type=forking
User=%I
WorkingDirectory=/home/%I
ExecStart=/usr/bin/tmux new-session -s %u -d
ExecStop=/usr/bin/tmux kill-session -t %u

[Install]
WantedBy=multi-user.target
```

```bash
systemctl enable tmux@ben
```

## 4. Advanced setup
### 4.1. msmtp & upmail

```bash
pacman -S msmtp
cp bin/msmtp*.sh
cp bin/upmail.sh
```

### 4.2. uptimed

```bash
pacman -S uptimed
cp records /var/spool/uptimed
systemctl enable uptimed
systemctl start uptimed
```
### 4.3. vnstat

```bash
pacman -S vnstat
cp vnstat.db /var/lib/vnstat/vnstat.db
systemctl enable vnstat
systemctl start vnstat
```

### 4.4. cronie

```bash
pacman -S cronie
systemctl enable cronie
systemctl start cronie
```

### 4.5. samba

```bash
pacman -S samba

smbpasswd -a ben
smbpasswd ben

mkdir /srv/smb
chown nobody:nobody /srv/smb

systemctl enable smb
systemctl start smb
```

## Fixes
### Raspberry Pi 4 uas slow ssd speed

```bash
dmesg |grep usb

usb 2-2: new SuperSpeed Gen 1 USB device number 2 using xhci_hcd 
usb 2-2: New USB device found, idVendor=152d, idProduct=0578, bcdDevice= 2.09
usb 2-2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
usb 2-2: Product: USB to ATA/ATAPI Bridge
usb 2-2: Manufacturer: JMicron
usb 2-2: SerialNumber: 0123456789ABCDEF

vi /boot/cmdline.txt
usb-storage.quirks=152d:0578:u
```
