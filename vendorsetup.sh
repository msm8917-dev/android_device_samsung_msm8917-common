cd packages/modules/NetworkStack
curl https://github.com/goldfish07/packages_modules_NetworkStack/commit/6fe388afb2c21bd7a7d27fc27353554fdfd8b6e5.patch | git am -C0 -3 || (echo "Failed to apply patch" && git am --abort)
cd -
