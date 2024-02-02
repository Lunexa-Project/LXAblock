# Lunexaexplorer

Lunexaexplorer is a trustless block eLunexaexplorerxplorer for the Monero payment network.

## Running Lunexaexplorer

To run Lunexaexplorer download the prebuilt binaries from [here](https://github.com/duggavo/Lunexaexplorer/releases) for your OS and run them.
Once LXAexplorer is started open [127.0.0.1:31312](http://127.0.0.1:31312/) with your browser.

**note**: You need monerod running in your computer for LXAexplorer to work, unless you are using a remote daemon.

### Running with a remote daemon
Use `LXAexplorer --daemon <Remote daemon address>` to start LXAexplorer with a remote node.
If you wish to use Tor to connect to the remote daemon, start LXAexplorer with:
`LXAexplorer --proxy socks5://127.0.0.1:9050 --daemon <Remote daemon address>`

## Compiling from source
You need Go and Git installed to compile LXAexplorer.
```
git clone https://github.com/duggavo/LXAexplorer && cd ./LXAexplorer
go get ./...
go build -ldflags="-s -w" ./
```

### Donate
If you wish to support the LXAexplorer development please donate any amount:

Monero: `892HHTyDg5mJm5eWJWZ8L1ZMYnnWExciQFFkpsgLh1DfVUXfUFj6z1X2jDD2ZRQLiwWYskeyNkrtpAHse4M3G29uBfiYgVL`
Wownero: `WW439rW1B6p4pA9oca1Aip6h2dneUCHTL9qdn5fstfkB1DzokvrU2hYGASDUcyfaa9gv5kXS82TUhRALMGJGFmBA26jAz3qM5ss`