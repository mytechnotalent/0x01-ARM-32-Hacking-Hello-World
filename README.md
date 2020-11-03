![image](https://github.com/mytechnotalent/0x01_arm_32_hacking_hello_world/blob/main/RPI32AAHHW.png?raw=true)

# 0x01_arm_32_hacking_hello_world
ARM 32-bit Raspberry Pi Hacking Hello World example in Kali Linux.

## Schematic
![image](https://github.com/mytechnotalent/0x01_arm_32_hacking_hello_world/blob/main/schematic.png?raw=true)

## Parts
[Raspberry Pi 4](https://www.adafruit.com/product/4292)
[64GB Micro SD Card](https://www.amazon.com/SDSDQUA-064G-A11-Professional-MicroSDXC-formatted-recording/dp/106171327X)
[Micro SD Card Reader/Writer](https://www.amazon.com/uni-Adapter-Supports-Compatible-MacBook/dp/B081VHSB2V)

## STEP 1: Download Kali Linux ARM Image - Raspberry Pi 32-bit
[Download](https://images.kali.org/arm-images/kali-linux-2020.3a-rpi3-nexmon.img.xz)

## STEP 2: Download balenaEtcher
[Download](https://www.balena.io/etcher)

## STEP 3: Flash Kali Linux ARM Image
[Watch YT Null Byte Video](https://www.youtube.com/watch?v=Jquf9BDm4iU&t=493s)

## STEP 4: Power Up RPI & Login
***POWER UP DEVICE AND LOGIN AS KALI AND SET UP SSH***

## STEP 5: Create File In VIM
```
.global _start

_start:
    mov R0, #1                      @ 1 = stdout
    ldr R1, =hello_world            @ str pointer
    mov R2, #13                     @ str len
    mov R7, #4                      @ linux write syscall
    svc 0                           @ software interrupt call write

exit:
    mov R0, #0                      @ return code
    mov R7, #1                      @ linux exit syscall
    svc 0                           @ software interrupt call exit

.data
hello_world:                        .ascii "Hello World!\n"
```

## STEP 6: Save File As - 0x01_arm_32_hacking_hello_world.s

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[Apache License, Version 2.0](https://www.apache.org/licenses/LICENSE-2.0)
