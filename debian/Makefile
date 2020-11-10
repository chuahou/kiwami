# SPDX-License-Identifier: MIT
# Copyright (c) 2020 Chua Hou

#####################
##### Functions #####
#####################

# Function for building package and cleaning up after
# First argument is package name, builds package in folder $(1) to file in
# $(BUILD_DIR)/$(1).deb
define build_pkg
./build_pkg.sh $(1) $(BUILD_DIR)
endef

# Function for cleaning auxiliary files
define clean_aux
rm *.build *.buildinfo *.changes || true
endef

#########################
##### Configuration #####
#########################

# Build directory
BUILD_DIR := build

# Prereq packages to be copied to prereq directory
PREREQ_DIR  := ../prereq
PREREQ_PKGS := kiwami-apt-source kiwami-prereq
PREREQ_DEBS := $(PREREQ_PKGS:%=$(PREREQ_DIR)/%.deb)

# List of packages to build
PKGS := kiwami-pkgs kiwami-scripts $(PREREQ_PKGS)

# Dummy targets
# Building dummy target involves building corresponding deb and installing it.
# .dummy file is created upon dpkg installation, so we do not install packages
# that are not outdated
DUMMY_TGT := $(PKGS:%=$(BUILD_DIR)/%.dummy)

#######################
##### Phony rules #####
#######################

.PHONY: all clean cleanaux

# Build all and install
all: | $(BUILD_DIR) $(DUMMY_TGT) $(PREREQ_DEBS)

# Clean up deb and auxiliary outputs
clean: cleanaux
	rm $(BUILD_DIR)/* || true

# Clean up auxiliary outputs
cleanaux:
	$(call clean_aux)

########################
##### Manual rules #####
########################

$(BUILD_DIR)/%.deb: %.meta
	quickdep $<
	mv $$(echo $< | sed 's/\.meta$$//')*.deb $@

.PRECIOUS: $(BUILD_DIR)/%.deb

$(BUILD_DIR)/kiwami-scripts.deb: kiwami-scripts $(shell find kiwami-scripts -type f)
	$(call build_pkg,$<)
	$(call clean_aux)
	touch $@ # ensure package newer than folder

$(BUILD_DIR)/kiwami-apt-source.deb: kiwami-apt-source $(shell find kiwami-apt-source -type f)
	$(call build_pkg,$<)
	$(call clean_aux)
	touch $@ # ensure package newer than folder

###########################
##### Automated rules #####
###########################

%.dummy: %.deb
	sudo apt-get install -y ./$<
	touch $@

$(PREREQ_DIR)/%.deb: $(BUILD_DIR)/%.deb $(PREREQ_DIR)
	cp $< $@

$(BUILD_DIR) $(PREREQ_DIR):
	mkdir -p $@
