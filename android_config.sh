# Use ". android_config.sh" to refresh prebuilt android config
# Note: this rebuild the compressed usage ressources and should be done
#       in a separate commit, to ignore it on future merge/rebase

make mrproper

cp .config-minimal .config
echo >> .config
echo 'CONFIG_CROSS_COMPILER_PREFIX="arm-eabi-"' >> .config
make prepare
cd include-minimal && ./copy-current.sh
cd ..

cp .config-full .config
echo >> .config
echo 'CONFIG_CROSS_COMPILER_PREFIX="arm-eabi-"' >> .config
make prepare
cd include-full && ./copy-current.sh
cd ..
