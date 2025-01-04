# EVM Library

A Bash library containing useful functions to write native applications interacting with EVM-compatible blockchain networks.

You can use this library into your program by pasting the following at the beginning of your program.

```bash
_bin="$( \
  dirname \
    "$( \
      command \
        -v \
	  "env")")"
_lib="${_bin}/../lib"
source \
  "${_lib}/libevm/libevm"
```

The library depends on `crash-bash`, `evm-chains-info`, `evm-chains-explorers`, `evm-contract-tools` and it is supposed to be used with
`evm-wallet` and `solidity-compiler`, together with which it makes up the `evm-toolchain`.

EVM stands for *Ethereum Virtual Machine*.

## License

The libEVM library is released under the terms of the GNU Affero General Public License version 3.0
