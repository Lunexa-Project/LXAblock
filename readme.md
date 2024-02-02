# LXAblock

Lunexaexplorer is a trustless block eLunexaexplorerxplorer for the Monero payment network.

## Running LXAblock

To run Lunexaexplorer download the prebuilt binaries from [here](https://github.com/lunexa-project/Lunexaexplorer/releases) for your OS and run them.
Once LXAexplorer is started open [127.0.0.1:31312](http://127.0.0.1:31312/) with your browser.

**note**: You need lunexad running in your computer for LXAexplorer to work, unless you are using a remote daemon.

### Running with a remote daemon
Use `LXAexplorer --daemon <Remote daemon address>` to start LXAexplorer with a remote node.
If you wish to use Tor to connect to the remote daemon, start LXAexplorer with:
`LXAexplorer --proxy socks5://127.0.0.1:9050 --daemon <Remote daemon address>`

## Compiling from source
You need Go and Git installed to compile LXAexplorer.
```
git clone https://github.com/lunexa-project/lxablock && cd ./lxablock
go get ./...
go build -ldflags="-s -w" ./
```

### Donate
If you wish to support the LXAexplorer development please donate any amount:

Lunexa: `9Egm2aoGQ4x7g1cVmhRK1j6Q5xYtZyfn6LUUZsC4fzs75SjSoQcEqyKhF4pyWQuin9L1f4ndLeiGMPdq8G96mXWdNAHxqpG`
