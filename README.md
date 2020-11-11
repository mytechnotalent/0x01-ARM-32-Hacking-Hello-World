![image](https://github.com/mytechnotalent/0x01_arm_32_hacking_hello_world/blob/main/RPI32AAHHW.png?raw=true)

# 0x01_arm_32_hacking_hello_world
ARM 32-bit Raspberry Pi Hacking Hello World example in Kali Linux.

## Schematic
![image](https://github.com/mytechnotalent/0x01_arm_32_hacking_hello_world/blob/main/schematic.png?raw=true)

## Parts
[Raspberry Pi 4](https://www.adafruit.com/product/4292)<br>
[64GB Micro SD Card](https://www.amazon.com/SDSDQUA-064G-A11-Professional-MicroSDXC-formatted-recording/dp/106171327X)<br>
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

print_hello_world:
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

## STEP 6: Save File As - 0x01_arm_32_hacking_hello_world.s [:wq]

## STEP 7: Build & Link
```
as -o 0x01_arm_32_hacking_hello_world.o 0x01_arm_32_hacking_hello_world.s
ld -o 0x01_arm_32_hacking_hello_world 0x01_arm_32_hacking_hello_world.o
```

## STEP 8: Run Binary
```
./0x01_arm_32_hacking_hello_world
Hello World!
```

## STEP 9: Run Radare2 - Debug Mode
```
r2 -d ./0x01_arm_32_hacking_hello_world
```

## STEP 10: Run Radare2 - Debug Step 1 [Examine Binary @ Entry Point]
```
aaa
s entry0
vv
```
![image](https://github.com/mytechnotalent/0x01_arm_32_hacking_hello_world/blob/main/1.png?raw=true)

## STEP 11: Run Radare2 - Debug Step 2 [Examine str]
```
q
[0x00010074]> pf S @0x00010094
0x00010094 = 0x00010094 -> 0x00020098 "Hello World!
A"
```

## STEP 12: Run Radare2 - Debug Step 3 [Hack str]
```
w Hacked World\n @0x00020098
```

## STEP 13: Run Radare2 - Debug Step 4 [Review Hack]
```
[0x00010074]> pf S @0x00010094
0x00010094 = 0x00010094 -> 0x00020098 "Hacked World
A"
```

## STEP 14: Run Radare2 - Debug Step 5 [Hack Binary Permanently]
```
q
r2 -w ./0x01_arm_32_hacking_hello_world
[0x00010074]> w Hacked World\n @0x00020098
[0x00010074]> q

```

## STEP 15: Prove Hack
```
./0x01_arm_32_hacking_hello_world
Hacked World
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[Apache License, Version 2.0](https://www.apache.org/licenses/LICENSE-2.0)
