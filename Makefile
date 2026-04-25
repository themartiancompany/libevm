# SPDX-License-Identifier: GPL-3.0-or-later

#    ----------------------------------------------------------------------
#    Copyright © 2025  Pellegrino Prevete
#
#    All rights reserved
#    ----------------------------------------------------------------------
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU Affero General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU Affero General Public License for more details.
#
#    You should have received a copy of the GNU Affero General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>.

PREFIX ?= /usr/local
_PROJECT=libevm
DOC_DIR=$(DESTDIR)$(PREFIX)/share/doc/$(_PROJECT)
BIN_DIR=$(DESTDIR)$(PREFIX)/bin
LIB_DIR=$(DESTDIR)$(PREFIX)/lib/$(_PROJECT)
NODE_DIR=$(DESTDIR)$(PREFIX)/lib/node_modules/$(_PROJECT)
MAN_DIR?=$(DESTDIR)$(PREFIX)/share/man

_INSTALL_FILE=\
  install \
    -vDm644
_INSTALL_EXE=\
  install \
    -vDm755
_INSTALL_DIR=\
  install \
    -vdm755

DOC_FILES=\
  $(wildcard \
      *.rst)
SCRIPT_FILES=\
  $(wildcard \
      $(_PROJECT)/*)

all: build-npm submodules

submodules:

	git \
	  submodule \
	    update \
	    --init \
	      "man"
	git \
	  submodule \
	    update \
	    --init \
	      "$(_PROJECT)/nodejs"

check: shellcheck

shellcheck:

	shellcheck \
	  -s \
	    "bash" \
	  $(SCRIPT_FILES)

build-npm:

	cd \
	  "$(_PROJECT)/nodejs"; \
	make \
	  build-npm


install: install-scripts install-doc install-man


install-scripts:

	$(_INSTALL_FILE) \
	  "$(_PROJECT)/$(_PROJECT)" \
	  "$(LIB_DIR)/$(_PROJECT)"
	$(_INSTALL_FILE) \
	  "$(_PROJECT)/nodejs/$(_PROJECT)" \
	  "$(LIB_DIR)/$(_PROJECT)-js"
	$(_INSTALL_EXE) \
	  "$(_PROJECT)/$(_PROJECT)-requirements" \
	  "$(BIN_DIR)/$(_PROJECT)-requirements"

install-npm:

	cd \
	  "$(_PROJECT)/nodejs"; \
	make \
	  install-npm; \
	cd \
	  "../.."
	$(_INSTALL_DIR) \
	  "$(LIB_DIR)"
	ln \
	  -s \
	  "$(NODE_DIR)/$(_PROJECT)" \
	  "$(LIB_DIR)/$(_PROJECT)-js" || \
	  true

install-doc:

	$(_INSTALL_FILE) \
	  $(DOC_FILES) \
	  -t \
	  $(DOC_DIR)

install-man:

	$(_INSTALL_DIR) \
	  "$(MAN_DIR)/man1"
	rst2man \
	  "man/$(_PROJECT).1.rst" \
	  "$(MAN_DIR)/man1/$(_PROJECT).1"
	rst2man \
	  "man/$(_PROJECT).js.1.rst" \
	  "$(MAN_DIR)/man1/$(_PROJECT).js.1"

.PHONY: check install install-doc install-man install-scripts shellcheck submodules
