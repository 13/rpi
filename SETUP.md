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
