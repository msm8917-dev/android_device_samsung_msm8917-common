PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.ebpf.supported=false \
    af.fast_track_multiplier=1 \
    audio.deep_buffer.media=true \
    audio.offload.min.duration.secs=30 \
    audio.offload.video=true \
    persist.vendor.audio.fluence.speaker=true \
    persist.vendor.audio.fluence.voicecall=true \
    persist.vendor.audio.fluence.voicerec=false \
    persist.vendor.audio.hw.binder.size_kbyte=1024 \
    persist.vendor.audio.speaker.prot.enable=false \
    ro.af.client_heap_size_kbyte=7168 \
    ro.vendor.audio.sdk.fluencetype=none \
    ro.vendor.audio.sdk.ssr=false \
    vendor.audio.dolby.ds2.enabled=false \
    vendor.audio.dolby.ds2.hardbypass=false \
    vendor.audio.flac.sw.decoder.24bit=true \
    vendor.audio.hw.aac.encoder=true \
    vendor.audio.offload.buffer.size.kb=64 \
    vendor.audio.offload.gapless.enabled=true \
    vendor.audio.offload.multiaac.enable=true \
    vendor.audio.offload.multiple.enabled=false \
    vendor.audio.offload.passthrough=false \
    vendor.audio.offload.track.enable=true \
    vendor.audio.parser.ip.buffer.size=262144 \
    vendor.audio.playback.mch.downsample=true \
    vendor.audio.pp.asphere.enabled=false \
    vendor.audio.safx.pbe.enabled=true \
    vendor.audio.tunnel.encode=false \
    vendor.audio.use.sw.alac.decoder=true \
    vendor.audio.use.sw.ape.decoder=true \
    vendor.audio_hal.period_size=192 \
    vendor.voice.conc.fallbackpath=deep-buffer \
    vendor.voice.path.for.pcm.voip=true \
    vendor.voice.playback.conc.disabled=true \
    vendor.voice.record.conc.disabled=false \
    vendor.voice.voip.conc.disabled=true \
    persist.vendor.cne.feature=0 \
    rild.libargs=-d /dev/umts_ipc0 \
    ro.frp.pst=/dev/block/bootdevice/by-name/config \
    debug.egl.hw=0 \
    debug.gralloc.enable_fb_ubwc=1 \
    debug.sf.hw=0 \
    debug.sf.latch_unsignaled=1 \
    persist.demo.hdmirotationlock=false \
    vendor.display.disable_skip_validate=1 \
    vendor.display.enable_default_color_mode=1 \
    vendor.mediacodec.binder.size=4 \
    vendor.vidc.disable.split.mode=1 \
    persist.hwc.enable_vds=1 \
    persist.vendor.qcomsysd.enabled=1 \
    ro.arch=msm8937_32 \
    ro.debug_level=0x494d \
    ro.hdcp2.rx=tz \
    ro.kernel.qemu.gles=2 \
    ro.wsmd.enable=true \
    security.ASKS.policy_version=000000 \
    security.mdpp.mass=skmm \
    sys.config.activelaunch_enable=true \
    sys.disable_ext_animation=1 \
    ro.hardware.nfc_nci=nqx.default \
    persist.backup.ntpServer=0.pool.ntp.org \
    ro.vendor.extension_library=libqti-perfd-client.so \
    vendor.perf.iop_v3.enable=true \
    persist.vendor.radio.apm_sim_not_pwdn=1 \
    persist.vendor.radio.atfwd.start=true \
    persist.vendor.radio.custom_ecc=1 \
    persist.vendor.radio.rat_on=combine \
    persist.vendor.radio.sib16_support=1 \
    ro.telephony.default_network=9 \
    rild.libpath=/system/vendor/lib/libril-qc-qmi-1.so \
    vendor.rild.libpath=/system/vendor/lib/libril-qc-qmi-1.so \
    vendor.sec.rild.libpath2=/vendor/lib/libsec-ril-dsds.so \
    vendor.sec.rild.libpath=/vendor/lib/libsec-ril.so \
    debug.hwui.renderer=opengl \
    dev.usbsetting.embedded=on \
    media.settings.xml=/vendor/etc/media_profiles_vendor.xml \
    vendor.vidc.enc.narrow.searchrange=1 \
    persist.vendor.qti.telephony.vt_cam_interface=1

# XXX Somehow works on J2 2018
PRODUCT_PROPERTY_OVERRIDES += ro.hardware.gatekeeper=mdfpp

ifneq ($(TARGET_DEVICE_LEGACY_KM),true)
# We can't have mdfpp keymaster on j2
PRODUCT_PROPERTY_OVERRIDES += \
    ro.security.keystore.keytype=sak,gak \
    ro.hardware.keystore=mdfpp
endif

ifneq ($(TARGET_DEVICE_SIM_COUNT),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.multisim.simslotcount=$(TARGET_DEVICE_SIM_COUNT)
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.multisim.simslotcount=2
endif

# SurfaceFlinger
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.surface_flinger.protected_contents=true

PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.early_phase_offset_ns=1500000 \
    debug.sf.early_app_phase_offset_ns=1500000 \
    debug.sf.early_gl_phase_offset_ns=3000000 \
    debug.sf.early_gl_app_phase_offset_ns=15000000
