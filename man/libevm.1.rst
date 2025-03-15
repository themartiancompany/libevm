..
   SPDX-License-Identifier: AGPL-3.0-or-later

   ----------------------------------------------------------------------
   Copyright © 2024, 2025  Pellegrino Prevete

   All rights reserved
   ----------------------------------------------------------------------

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU Affero General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU Affero General Public License for more details.

   You should have received a copy of the GNU Affero General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.


==================
libevm
==================

-----------------------------------------------------------
Ethereum Virtual Machine (EVM) Library
-----------------------------------------------------------
:Version: libevm |version|
:Manual section: 1

Synopsis
========


..  code-block:: bash

    _bin="$( \
      dirname \
        "$( \
          command \
            -v \
            "env")")"
    _lib="${_bin}/../lib"
    source \
      "${_lib}/libevm/libevm"

Description
===========

Bash and JavaScript library providing useful functions
to write native applications interacting with
Ethereum Virtual Machine (EVM) compatible blockchain networks.

The library depends on
`Crash Bash`_, `EVM Chains Info`_, `EVM Chains Explorers`_,
the `EVM Contracts Tools`_, and it is supposed to be used
with `EVM Wallet`_ and `Solidity Compiler`_.

The build reference tool for applications using the library
is `EVM Make`_.

The library, together with the aforementioned applications
as well as others makes up the EVM Toolchain.

EVM stands for *Ethereum Virtual Machine*.

Significant applications developed using the library are
the `Ethereum Virtual Machine File System`_ (EVMFS),
the `Ur`_ uncensorable Life and DogeOS user repository
and application store, its reference
`pub`_ publishing tool and source retrieval tool `aspe`_,
`EVM OpenPGP Key Server`_, the uncensorable, undeletable,
distributed, network-neutral, decentralized Twitter
(whose sources are entirely hosted on
the EVMFS) and many others currently in development.

LibEVM is a core component of the
Human Instrumentality Project (HIP).

Bugs
====

https://github.com/themartiancompany/libevm/-/issues

Copyright
=========

Copyright Pellegrino Prevete. AGPL-3.0.

See also
========

* libevm-js
* evm-chains-explorers
* evm-chains-info
* evm-contract-call
* evm-contract-deployment-address
* evm-contract-deployment-networks
* evm-contract-deployment-versions
* evm-contract-deployments-dir
* evm-deployer
* evm-make
* evm-wallet
* solidity-compiler

.. include:: variables.rst
