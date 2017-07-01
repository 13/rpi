# rpi

Modules
-------

### RTC (DS3231)

Edit `/boot/config.txt`:

    dtoverlay=i2c-rtc,ds3231

Edit `/etc/modules-load.d/raspberrypi.conf`:

    i2c-bcm2835
    
    i2c-dev
    
    rtc-ds1307
    
Add `/etc/udev/rules.d/rtc-i2c.rules`

    KERNEL=="rtc0", RUN+="/sbin/hwclock --hctosys"
    
Test:

    i2cdetect -y 1
    
    hwclock -r

### Temperature (DHT22)

    git clone https://github.com/adafruit/Adafruit_Python_DHT.git
    
    cd Adafruit_Python_DHT
    
    sudo python setup.py install

Backup
------

    mkdir root

    mount /dev/sdd2 root
    mount /dev/sdd1 root/boot

    cd root

    bsdtar -cpf /zoid/piw-20170701.tar.gz .

    umount -R root
