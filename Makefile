hide := @
ECHO := echo

SYS_PATH := ../../buildroot/output/rockchip_puma/host/arm-buildroot-linux-gnueabihf/sysroot
OUT_PATH := ../../buildroot/output/rockchip_puma/target
STAGOUT_PATH := ../../buildroot/output/rockchip_puma/staging
INC_FILES := -I $(SYS_PATH)/usr/include \
             -I $(SYS_PATH)/usr/include/dbus-1.0 \
             -I $(SYS_PATH)/usr/lib/dbus-1.0/include \
             -I $(SYS_PATH)/usr/include/glib-2.0 \
             -I $(SYS_PATH)/usr/lib/glib-2.0/include \
             -I $(SYS_PATH)/usr/include/libdrm \
             -I $(OUT_PATH)/usr/include \
             -I $(STAGOUT_PATH)/usr/include \
             -I gdbus
LIB_FILES := -L $(OUT_PATH)/usr/lib

LD_FLAGS := -ldbus-1 -ldbus-glib-1 -lglib-2.0 -lgio-2.0
SRC_FILES := *.c

LIB_FILE := libgdbus.so

out:
	$(hide)$(ECHO) "Build clock ..."
	./../../buildroot/output/rockchip_puma/host/usr/bin/arm-buildroot-linux-gnueabihf-gcc -fPIC -shared $(SRC_FILES) $(INC_FILES) $(LIB_FILES) $(LD_FLAGS) -o $(LIB_FILE)
	cp *.h $(STAGOUT_PATH)/usr/include/
	cp libgdbus.so $(STAGOUT_PATH)/usr/lib/
	$(hide)$(ECHO) "Build clock Done ..."
