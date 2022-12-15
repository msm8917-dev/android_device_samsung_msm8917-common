cd packages/modules/NetworkStack
curl https://github.com/goldfish07/packages_modules_NetworkStack/commit/6fe388afb2c21bd7a7d27fc27353554fdfd8b6e5.patch | git am -C0 -3 || (echo "Failed to apply tcp patch" && git am --abort)
cd -
cd frameworks/base
git reset --hard
curl https://raw.githubusercontent.com/lineageos4microg/docker-lineage-cicd/master/src/signature_spoofing_patches/android_frameworks_base-R.patch | git apply || (echo "Failed to apply microg" && git reset --hard)
cd -
