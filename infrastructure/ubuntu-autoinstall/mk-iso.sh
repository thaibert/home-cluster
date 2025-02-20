#!/usr/bin/env bash

# Expected to be run from <home-cluster>/ubuntu-autoinstall

# modified output from `xorriso -indev <original-iso> -report_el_torito as_mkisofs`:
options=(
  -V 'Ubuntu-Server 24.04.1 LTS amd64'
  # --modification-date='2024120309572500'
  # --grub2-mbr --interval:local_fs:0s-15s:zero_mbrpt,zero_gpt:'noble-live-server-amd64.iso'
  --grub2-mbr ./BOOT/1-Boot-NoEmul.img
  # --protective-msdos-label  # TODO: necessary?
  # -partition_cyl_align off  # TODO: necessary?
  -partition_offset 16
  --mbr-force-bootable
  # -append_partition 2 28732ac11ff8d211ba4b00a0c93ec93b --interval:local_fs:5480204d-5490347d::'noble-live-server-amd64.iso'
  -append_partition 2 28732ac11ff8d211ba4b00a0c93ec93b ./BOOT/2-Boot-NoEmul.img
  -appended_part_as_gpt
  -iso_mbr_part_type a2a0d0ebe5b9334487c068b6b72699c7
  -c '/boot.catalog'
  -b '/boot/grub/i386-pc/eltorito.img'
  -no-emul-boot
  -boot-load-size 4
  -boot-info-table
  --grub2-boot-info
  -eltorito-alt-boot
  # -e '--interval:appended_partition_2_start_1370051s_size_10144d:all::'
  -e '--interval:appended_partition_2:::'
  -no-emul-boot
  # -boot-load-size 10144
)

xorriso -as mkisofs -r "${options[@]}" "./iso-contents/" -o "ubuntu-24.04.01-autoinstall.iso"

