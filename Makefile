include theos/makefiles/common.mk

TWEAK_NAME = DeDirect
DeDirect_FILES = Tweak.xm
DeDirect_FRAMEWORKS = WebKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall MobileMail; sleep 0.2; sblaunch com.apple.mobilemail"
