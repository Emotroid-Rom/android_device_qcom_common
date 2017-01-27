#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

set -e

export INITIAL_COPYRIGHT_YEAR=2016

# Required!
DEVICE=binaries
DEVICE_COMMON="common/extractors"
VENDOR=qcom

# Load extractutils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$MY_DIR" ]]; then MY_DIR="$PWD"; fi

EMOTION_ROOT="$MY_DIR"/../../../..

HELPER="$EMOTION_ROOT"/vendor/emotion/build/tools/extract_utils.sh
if [ ! -f "$HELPER" ]; then
    echo "Unable to find helper script at $HELPER"
    exit 1
fi
. "$HELPER"

PLATFORM=msm8916
SUBSYSTEM=graphics

# Initialize the helper
setup_vendor "$DEVICE/${PLATFORM}-32/$SUBSYSTEM" "$VENDOR" "$EMOTION_ROOT" true true $SUBSYSTEM

# Copyright headers and guards
write_headers $PLATFORM TARGET_BOARD_PLATFORM

# Qualcomm BSP blobs - we put a conditional around here
# in case the BSP is actually being built
echo "ifeq (\$(QCPATH),)" >> "$PRODUCTMK"

write_makefiles "$MY_DIR"/"$SUBSYSTEM-$PLATFORM"-32.txt

printf "endif" >> "$PRODUCTMK"

# We are done!
write_footers

# Initialize the helper
setup_vendor "$DEVICE/${PLATFORM}-64/$SUBSYSTEM" "$VENDOR" "$EMOTION_ROOT" true true $SUBSYSTEM

# Copyright headers and guards
write_headers $PLATFORM TARGET_BOARD_PLATFORM

# Qualcomm BSP blobs - we put a conditional around here
# in case the BSP is actually being built
echo "ifeq (\$(QCPATH),)" >> "$PRODUCTMK"

write_makefiles "$MY_DIR"/"$SUBSYSTEM-$PLATFORM"-64.txt

printf "endif" >> "$PRODUCTMK"

# We are done!
write_footers

PLATFORM=msm8952
SUBSYSTEM=graphics

# Initialize the helper
setup_vendor "$DEVICE/${PLATFORM}-32/$SUBSYSTEM" "$VENDOR" "$CM_ROOT" true true $SUBSYSTEM

# Copyright headers and guards
write_headers $PLATFORM TARGET_BOARD_PLATFORM

# Qualcomm BSP blobs - we put a conditional around here
# in case the BSP is actually being built
echo "ifeq (\$(QCPATH),)" >> "$PRODUCTMK"

write_makefiles "$MY_DIR"/"$SUBSYSTEM-$PLATFORM"-32.txt

printf "endif" >> "$PRODUCTMK"

cat << EOF >> "$ANDROIDMK"
\$(shell mkdir -p \$(PRODUCT_OUT)/system/vendor/lib/egl && pushd \$(PRODUCT_OUT)/system/vendor/lib > /dev/null && ln -s egl/libEGL_adreno.so libEGL_adreno.so && popd > /dev/null)
EOF

# We are done!
write_footers

# Initialize the helper
setup_vendor "$DEVICE/${PLATFORM}-64/$SUBSYSTEM" "$VENDOR" "$CM_ROOT" true true $SUBSYSTEM

# Copyright headers and guards
write_headers $PLATFORM TARGET_BOARD_PLATFORM

# Qualcomm BSP blobs - we put a conditional around here
# in case the BSP is actually being built
echo "ifeq (\$(QCPATH),)" >> "$PRODUCTMK"

write_makefiles "$MY_DIR"/"$SUBSYSTEM-$PLATFORM"-64.txt

printf "endif" >> "$PRODUCTMK"

cat << EOF >> "$ANDROIDMK"
\$(shell mkdir -p \$(PRODUCT_OUT)/system/vendor/lib64/egl && pushd \$(PRODUCT_OUT)/system/vendor/lib64 > /dev/null && ln -s egl/libEGL_adreno.so libEGL_adreno.so && popd > /dev/null)
EOF

# We are done!
write_footers

PLATFORM=msm8960
SUBSYSTEM=graphics

# Initialize the helper
setup_vendor "$DEVICE/$PLATFORM/$SUBSYSTEM" "$VENDOR" "$EMOTION_ROOT" true true $SUBSYSTEM

# Copyright headers and guards
write_headers $PLATFORM TARGET_BOARD_PLATFORM

# Qualcomm BSP blobs - we put a conditional around here
# in case the BSP is actually being built
printf '\n%s\n' "ifeq (\$(QCPATH),)" >> "$PRODUCTMK"

write_makefiles "$MY_DIR"/"$SUBSYSTEM-$PLATFORM".txt

echo "endif" >> "$PRODUCTMK"

# We are done!
write_footers

PLATFORM=msm8974
SUBSYSTEM=graphics

# Initialize the helper
setup_vendor "$DEVICE/$PLATFORM/$SUBSYSTEM" "$VENDOR" "$EMOTION_ROOT" true true $SUBSYSTEM

# Copyright headers and guards
write_headers $PLATFORM TARGET_BOARD_PLATFORM

# Qualcomm BSP blobs - we put a conditional around here
# in case the BSP is actually being built
printf '\n%s\n' "ifeq (\$(QCPATH),)" >> "$PRODUCTMK"

write_makefiles "$MY_DIR"/"$SUBSYSTEM-$PLATFORM".txt

echo "endif" >> "$PRODUCTMK"

# We are done!
write_footers

PLATFORM=msm8992
SUBSYSTEM=graphics

# Initialize the helper
setup_vendor "$DEVICE/$PLATFORM/$SUBSYSTEM" "$VENDOR" "$EMOTION_ROOT" true true $SUBSYSTEM

# Copyright headers and guards
write_headers $PLATFORM TARGET_BOARD_PLATFORM

# Qualcomm BSP blobs - we put a conditional around here
# in case the BSP is actually being built
printf '\n%s\n' "ifeq (\$(QCPATH),)" >> "$PRODUCTMK"

write_makefiles "$MY_DIR"/"$SUBSYSTEM-$PLATFORM".txt

echo "endif" >> "$PRODUCTMK"

cat << EOF >> "$ANDROIDMK"
\$(shell mkdir -p \$(PRODUCT_OUT)/system/vendor/lib/egl && pushd \$(PRODUCT_OUT)/system/vendor/lib > /dev/null && ln -s egl/libEGL_adreno.so libEGL_adreno.so && popd > /dev/null)
\$(shell mkdir -p \$(PRODUCT_OUT)/system/vendor/lib64/egl && pushd \$(PRODUCT_OUT)/system/vendor/lib64 > /dev/null && ln -s egl/libEGL_adreno.so libEGL_adreno.so && popd > /dev/null)
EOF

# We are done!
write_footers

PLATFORM=msm8994
SUBSYSTEM=graphics

# Initialize the helper
setup_vendor "$DEVICE/$PLATFORM/$SUBSYSTEM" "$VENDOR" "$EMOTION_ROOT" true true $SUBSYSTEM

# Copyright headers and guards
write_headers $PLATFORM TARGET_BOARD_PLATFORM

# Qualcomm BSP blobs - we put a conditional around here
# in case the BSP is actually being built
printf '\n%s\n' "ifeq (\$(QCPATH),)" >> "$PRODUCTMK"

write_makefiles "$MY_DIR"/"$SUBSYSTEM-$PLATFORM".txt

echo "endif" >> "$PRODUCTMK"

cat << EOF >> "$ANDROIDMK"
\$(shell mkdir -p \$(PRODUCT_OUT)/system/vendor/lib/egl && pushd \$(PRODUCT_OUT)/system/vendor/lib > /dev/null && ln -s egl/libEGL_adreno.so libEGL_adreno.so && popd > /dev/null)
\$(shell mkdir -p \$(PRODUCT_OUT)/system/vendor/lib64/egl && pushd \$(PRODUCT_OUT)/system/vendor/lib64 > /dev/null && ln -s egl/libEGL_adreno.so libEGL_adreno.so && popd > /dev/null)
EOF

# We are done!
write_footers

PLATFORM=msm8996
SUBSYSTEM=graphics

# Initialize the helper
setup_vendor "$DEVICE/$PLATFORM/$SUBSYSTEM" "$VENDOR" "$EMOTION_ROOT" true true $SUBSYSTEM

# Copyright headers and guards
write_headers $PLATFORM TARGET_BOARD_PLATFORM

# Qualcomm BSP blobs - we put a conditional around here
# in case the BSP is actually being built
printf '\n%s\n' "ifeq (\$(QCPATH),)" >> "$PRODUCTMK"
printf '\n%s\n' "ifeq (\$(QCPATH),)" >> "$ANDROIDMK"

write_makefiles "$MY_DIR"/"$SUBSYSTEM-$PLATFORM".txt

echo "endif" >> "$PRODUCTMK"

cat << EOF >> "$ANDROIDMK"
endif

\$(shell mkdir -p \$(PRODUCT_OUT)/system/vendor/lib/egl && pushd \$(PRODUCT_OUT)/system/vendor/lib > /dev/null && ln -s egl/libEGL_adreno.so libEGL_adreno.so && popd > /dev/null)
\$(shell mkdir -p \$(PRODUCT_OUT)/system/vendor/lib64/egl && pushd \$(PRODUCT_OUT)/system/vendor/lib64 > /dev/null && ln -s egl/libEGL_adreno.so libEGL_adreno.so && popd > /dev/null)
EOF

# We are done!
write_footers

SUBSYSTEM=audio

# Initialize the helper
setup_vendor "$DEVICE/$PLATFORM/$SUBSYSTEM" "$VENDOR" "$EMOTION_ROOT" true true $SUBSYSTEM

# Copyright headers and guards
write_headers $PLATFORM TARGET_BOARD_PLATFORM

# Qualcomm BSP blobs - we put a conditional around here
# in case the BSP is actually being built
printf '\n%s\n' "ifeq (\$(QCPATH),)" >> "$PRODUCTMK"

write_makefiles "$MY_DIR"/"$SUBSYSTEM-$PLATFORM".txt

echo "endif" >> "$PRODUCTMK"

# We are done!
write_footers

# Add a guard on the top level
cat << EOF > "$EMOTION_ROOT/vendor/$VENDOR/$DEVICE/Android.mk"
LOCAL_PATH := \$(call my-dir)

include \$(CLEAR_VARS)

ifeq (\$(BOARD_USES_QCOM_HARDWARE),true)
include \$(call all-makefiles-under,\$(LOCAL_PATH)/\$(TARGET_BOARD_PLATFORM))
endif
EOF
