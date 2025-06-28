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

The libEVM is a Bash library which includes
functions to easily write computer applications
which interact with smart contracts functions.

The following snippets of code assumes an application
written with the Crash Bash library.

If you are looking for a very old Crash Bash
example application, look at 'ahno'.

* Import:

..  code-block:: bash

    _bin="$( \
      dirname \
        "$( \
          command \
            -v \
    	  "env")")"
    _lib="$( \
      realpath \
        "${_bin}/../lib")"
    _crash_bash="${_lib}/libcrash-bash/crash-bash"
    _libevm="${_lib}/libevm/libevm"   # <---
    _sourced \
      "${_crash_bash}" 2>/dev/null || \
      source \
        "${_crash_bash}"
    _sourced \              # <---
      "${_libevm}"          # <---

* Init:

..  code-block:: bash

    _globals
    _global_variables
    _libevm_global_variables # <---

* Init application:

..  code-block:: bash

    _libevm_app_global_variables  # <---

* Set up command-line options:

..  code-block:: bash

    getopts_opts="$( \
      printf \
        "%s" \
        "A:V:" \
        "$(_libevm_app_getopts_params_get)" \
        "n:" \
        "$(_wallet_getopts_params_get)" \
        "vh?")"
    while \
      getopts \
        "${getopts_opts}" \
        arg; do
      _libevm_app_getopts_case
      _wallet_getopts_case
      case \
        "${arg}" in
        A) \
          override_my_app_contract_address="${OPTARG}" ;;
        V) \
          override_my_app_contract_version="${OPTARG}" ;;
        v) \
          override_quiet="n" ;;
        h) \
          _set_overrides && \
          _usage \
            0 ;;
        *) \
          if [[ " ${getopts_opts} " != *"${arg}"* ]]; then
            _msg_error \
              "Invalid argument '${arg}'." \
              0
            _usage \
              1
          fi ;;
      esac
    done

* Set overrides:

..  code-block:: bash

    _set_overrides() {
      if [[ -v override_quiet ]]; then
        quiet="${override_quiet}"
      elif [[ -z "${quiet}" ]]; then
        quiet="y"
      fi
      _set_override \
        "target" \
        "network" \
        "100"
      _set_override \
        "user" \
        "level" \
        "n"
      _set_override \
        "call" \
        "auth" \
        "y"
      _set_override \
        "wallet" \
        "name" \
        "default"
      _deployments_dir_auto_detect \
        "my-app" \
        "${user_level}"
      _network_auto_detect \
        "MyAppContract" \
        "${deployments_dir}" \
        "${user_level}"
      _api_key_auto_detect \
        "${target_network}"
      _wallet_overrides_set \
        "evm-wallet" \
        "${wallet_name}" \
        "${call_auth}"
      _contract_setup_auto_detect \
        "my-app" \
        "MyAppContract" \
        "my_app_contract" \
        "${target_network}" \
        "${user_level}" \
        "${deployments_dir}"
    }

* Load contract artifact and run the function in your code:

..  code-block:: bash

    _my_application() {
      _my_app_contract_address="${1}" \
      _my_app_contract_version="${2}" \
      _deployments_dir="${3}" \
      _wallet_name="${4}" \
      _wallet_seed="${5}" \
      _api_key="${6}" \
      _target_network="${7}" \
      _my_app_contract_abi \
      _my_app_contract_bytecode \
      _tw_compiler_output
    _contract_artifacts_auto_detect \
      "${_deployments_dir}" \
      "${_target_network}" \
      "MyAppContract" \
      "_my_app_contract" \
      "${_my_app_contract_version}"
    _evm_contract_call_opts+=(
      -A
        "${_my_app_contract_abi}"
      -B
        "${_my_app_contract_bytecode}"
      -C
        "${_my_app_contract_compiler_output}"
      -N
        "${_wallet_name}"
      -s
        "${_wallet_seed}"
    )
    _my_app_contract_function_opts=(
      "gum"
      "glue"
    )
    _function_output="$( \
      evm-contract-call \
        "${_evm_contract_call_opts}" \
        "${_my_app_contract_address}" \
        "myAppContractFunction" \
        "${_my_app_contract_function_opts[@]}")"
    _msg=(
      "This is the output of my app contract"
      "function 'myAppContractFunction' with"
      "argument '${_my_app_contract_function_opts[*]}':"
      "'${_function_output}'."
    echo \
      "${_msg[*]}"
    }

    _my_application \
      "$@"

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
