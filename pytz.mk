
# pytz.mk
# Makefile to include building sqlobject in a larger top-level project
# Copyright (C) 2018 Long Range Systems, LLC.  All rights reserved.

ifndef PYTZ_SRC_DIR
  PYTZ_SRC_DIR := $(dir $(lastword $(MAKEFILE_LIST)))
endif

ifndef BUILD_TOOLS_DIR
  ${error BUILD_TOOLS_DIR not defined! You must specify where build tools reside}
endif

# greenlet package version
PYTZ_PV = 1.4.1

# Build revision
PYTZ_PR = -r1

# Overall build version
PYTZ_BV = $(PYTZ_PV)$(PYTZ_PR)


PYTZ_DOTFILE = $(call python-cross-dotfile,pytz,$(PYTZ_BV))

PYTZ_DEPS = $(PYTZ_DOTFILE)

$(PYTZ_DOTFILE): $(BUILD_PYTHON_NATIVE_MODULE_DEPS)
	$(call build-python-native-module,$(PYTZ_SRC_DIR))
	touch $@
