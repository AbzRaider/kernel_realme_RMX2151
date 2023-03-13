#!/bin/bash

function compile() 
{
source ~/.bashrc && source ~/.profile
export LC_ALL=C && export USE_CCACHE=1
ccache -M 100G
export ARCH=arm64
export KBUILD_BUILD_HOST="MARK•DEVS"
export KBUILD_BUILD_USER="AbzRaiderXD"
git clone --depth=1 https://github.com/Kdrag0n/proton-clang.git clang
git clone --depth=1 https://github.com/LineageOS/android_prebuilts_gcc_linux-x86_aarch64_aarch64-linux-android-4.9 los-4.9-64
git clone --depth=1 https://github.com/LineageOS/android_prebuilts_gcc_linux-x86_arm_arm-linux-androideabi-4.9 los-4.9-32
if ! [ -d "out" ]; then
	echo "Kernel OUT Directory Not Found . Making Again"
mkdir out

else

	
	sleep 5
	echo "out directory already exists , Making Dirty Build !! "
	echo "If you want to clean Build , just rm -rf out"
	
fi

make O=out ARCH=arm64 RMX2151_defconfig

PATH="${PWD}/clang/bin:${PATH}:${PWD}/clang/bin:${PATH}:${PWD}/clang/bin:${PATH}" \
make -j$(nproc --all) O=out \
                      ARCH=arm64 \
                      CC="clang" \ 
		      OBJCOPY=llvm-objcopy \
		      OBJDUMP=llvm-objdump \
                      CLANG_TRIPLE=aarch64-linux-gnu- \
                      CROSS_COMPILE="${PWD}/clang/bin/aarch64-linux-gnu-" \
                      CROSS_COMPILE_ARM32="${PWD}/clang/bin/arm-linux-gnueabi-" \
                      CONFIG_NO_ERROR_ON_MISMATCH=y
}

function zupload()
{
if  [ -d "AnyKernel" ]; then	
	rm -rf AnyKernel
fi
git clone --depth=1 https://github.com/AbzRaider/AnyKernel_RMX2001 -b RMX2151 AnyKernel
cp out/arch/arm64/boot/Image.gz-dtb AnyKernel
cd AnyKernel
zip -r9 Azrael-lto-KERNEL-RMX2151.zip *
curl -sL https://git.io/file-transfer | sh
./transfer wet Azrael-lto-KERNEL-RMX2151.zip
}

compile
zupload
