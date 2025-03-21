#!/bin/bash
rm ./build/right.uf2
rm ./build/left.uf2
cp -r ~/Projects/keyboards/zmk_clacken/boards/shields/clacken ~/Projects/zmk/app/boards/shields/
#DIR=|pwd
cd ~/Projects/zmk/app
source ../.venv/bin/activate
west build -p -d build/left -b seeeduino_xiao_ble -S studio-rpc-usb-uart -- -DSHIELD=clacken_left -DCONFIG_ZMK_STUDIO=y
cp ./build/left/zephyr/zmk.uf2 ~/Projects/keyboards/zmk_clacken/build/left.uf2
west build -p -d build/right -b seeeduino_xiao_ble -- -DSHIELD=clacken_right
cp ./build/right/zephyr/zmk.uf2 ~/Projects/keyboards/zmk_clacken/build/right.uf2
