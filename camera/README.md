# rpi camera 

Edit `/boot/config.txt`:

    gpu_mem=128

    # Camera fixes
    disable_camera_led=1
    start_file=start_x.elf
    fixup_file=fixup_x.dat
    cma_lwm=
    cma_hwm=
    cma_offline_start=
 
    # Disable the ACT LED.
    dtparam=act_led_trigger=none
    dtparam=act_led_activelow=off
    
    # Disable the PWR LED.
    dtparam=pwr_led_trigger=none
    dtparam=pwr_led_activelow=off


Disable LAN LEDs:

    /usr/bin/lan951x-led-ctl --fdx=0 --lnk=0 --spd=0
    
Streaming:

    /usr/bin/mjpg_streamer -i "input_raspicam.so -x 1280 -y 720 -fps 15 -ex night" -o "output_http.so -p 8080 -w /usr/share/mjpg-streamer/www/ -n -c user:pass"
