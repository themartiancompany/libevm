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

The library depends on Crash Bash [1]_, EVM Chains Info [2]_,
EVM Chains Explorers [3]_, the EVM Contracts Tools [4]_,
and it is supposed to be used
with EVM Wallet [5]_ and Solidity Compiler [6]_.

The build reference tool for applications using the library
is EVM Make [7]_.

The library, together with the aforementioned applications
as well as others makes up the EVM Toolchain.

EVM stands for *Ethereum Virtual Machine*.

Significant applications developed using the library are
the Ethereum Virtual Machine File System (EVMFS) [8]_,
the Ur [9]_ uncensorable Life and DogeOS user repository
and application store, its reference
pub [10]_ publishing tool and source retrieval tool aspe [11]_,
EVM OpenPGP Key Server [12]_, the uncensorable, undeletable,
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

External Resources
===================

.. [1]  `Crash Bash`_
.. [2]  `EVM Chains Info`_
.. [3]  `EVM Chains Explorers`_
.. [4]  `EVM Contracts Tools`_
.. [5]  `EVM Wallet`_
.. [6]  `Solidity Compiler`_
.. [7]  `EVM Make`_
.. [8]  `Ethereum Virtual Machine File System`_
.. [9]  `Ur`_
.. [10] `Pub`_
.. [11] `Aspe`_
.. [12] `EVM OpenPGP Key Server`_

.. include:: variables.rst
