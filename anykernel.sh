# AnyKernel2 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() {
kernel.string=Frostbitten Kernel by Frostbite
device.name=for Moto G4/G4 Plus
release.version=Release 15
do.devicecheck=1
do.modules=0
do.cleanup=1
do.cleanuponabort=0
device.name1=athene
device.name2=athene_f
device.name3=athene_13mp
device.name4=athene_16mp
device.name5=
} # end properties

# shell variables
block=/dev/block/mmcblk0p28;
is_slot_device=0;

## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. /tmp/anykernel/tools/ak2-core.sh;

# Mount system to get Android version
mount -o rw,remount -t auto /system;

# Alert of unsupported Android version
android_ver=$(grep "^ro.build.version.release" /system/build.prop | cut -d= -f2);
case "$android_ver" in
  "8.1.0") support_status="supported";;
  *) support_status="unsupported";;
esac;
ui_print " ";
ui_print "Running Android $android_ver..."
ui_print "This kernel is $support_status for this version!";

# Unmount system
mount -o ro,remount -t auto /system;

## AnyKernel install
dump_boot;

write_boot;

## end install

