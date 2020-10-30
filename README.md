# rpi

Modules
-------

### Pressure/Altitude/Temperature (BMP085)

    git clone https://github.com/adafruit/Adafruit_Python_BMP.git
    
    cd Adafruit_Python_BMP
    
    sudo python setup.py install

### RTC (DS3231)

Edit `/boot/config.txt`:

    dtoverlay=i2c-rtc,ds3231

Edit `/etc/modules-load.d/raspberrypi.conf`:

    i2c-bcm2835
    
    i2c-dev
    
    rtc-ds1307
    
Add `/etc/udev/rules.d/50-rtc-hwclock.rules`

    KERNEL=="rtc0", RUN+="/sbin/hwclock -s"

Edit `/etc/mkinitcpio.conf`:

    MODULES=(i2c-bcm2835 i2c-dev rtc-ds1307)
    
    BINARIES=(hwclock)
    
    FILES=(/etc/udev/rules.d/50-rtc-hwclock.rules)

Test:

    i2cdetect -y 1
    
    hwclock -r

### Temperature/Humidity (DHT22)

    git clone https://github.com/adafruit/Adafruit_Python_DHT.git
    
    cd Adafruit_Python_DHT
    
    sudo python setup.py install

### Temperature (1Wire DS18B20)

Edit `/boot/config.txt`:

    dtoverlay=w1-gpio

Repo:

    git clone https://github.com/timofurrer/w1thermsensor

Backup
------

    mkdir root

    mount /dev/sdd2 root
    mount /dev/sdd1 root/boot

    cd root

    bsdtar -cpf /zoid/piw-20170701.tar.gz .

    umount -R root

Database
--------

    CREATE TABLE dht22 (id integer not null, temperature double precision not null, humidity double precision not null, tstamp timestamp not null);
    
    CREATE TABLE bmp085 (id integer not null, temperature double precision not null, pressure double precision not null, altitude double precision not null, tstamp timestamp not null);

    CREATE TABLE windspeed (id integer not null, speed double precision not null, tstamp timestamp not null);

    CREATE TABLE raingauge (id integer not null, rain double precision not null, tstamp timestamp not null);

    CREATE TABLE onewire (id integer not null, temperature double precision not null, tstamp timestamp not null);

    CREATE TABLE battery (id integer not null, volt double precision not null, tstamp timestamp not null);

    CREATE TABLE portal (id integer not null, state integer not null, tstamp timestamp not null);


