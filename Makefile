#############################################################################
# Makefile for building: pc-su
#############################################################################

####### Compiler, tools and options

PREFIX?= /usr/local
AR            = ar cqs
TAR           = tar -cf
COMPRESS      = gzip -9f
COPY          = cp -f
SED           = sed
COPY_FILE     = $(COPY)
COPY_DIR      = $(COPY) -R
INSTALL_FILE  = $(COPY_FILE)
INSTALL_DIR   = $(COPY_DIR)
INSTALL_PROGRAM = $(COPY_FILE)
DEL_FILE      = rm -f
SYMLINK       = ln -f -s
DEL_DIR       = rmdir
MOVE          = mv -f
CHK_DIR_EXISTS= test -d
MKDIR         = mkdir -p

first: all

all: 

clean:

check: first

install_scripts: first FORCE
	@$(CHK_DIR_EXISTS) $(INSTALL_ROOT)$(PREFIX)/share/trueos/scripts/ || $(MKDIR) $(INSTALL_ROOT)$(PREFIX)/share/trueos/scripts/
	-$(INSTALL_FILE) functions.sh $(INSTALL_ROOT)$(PREFIX)/share/trueos/scripts/


uninstall_scripts:  FORCE
	-$(DEL_FILE) -r $(INSTALL_ROOT)$(PREFIX)/share/trueos/scripts/functions.sh
	-$(DEL_DIR) $(INSTALL_ROOT)$(PREFIX)/share/trueos/scripts


install_dochmod: first FORCE
	@$(CHK_DIR_EXISTS) $(INSTALL_ROOT)$(PREFIX)/share/trueos/scripts/ || $(MKDIR) $(INSTALL_ROOT)$(PREFIX)/share/trueos/scripts/ 
	chmod 755 $(PREFIX)/share/trueos/scripts/functions.sh


install:  install_scripts install_dochmod  FORCE

uninstall: uninstall_scripts   FORCE

FORCE:

