# Development

## 1. get needed deps to be install locally

- node@14.x.x. `brew install node`
- postgresql. `brew install postgresql`
  ```
    /// update bash profile to start pg via short form
    #POSTGRESQL - START
    export PGDATA='$HOME/data/postgres'
    export PGHOST=localhost
    alias start-pg='pg_ctl -l $PGDATA/server.log start'
    alias stop-pg='pg_ctl stop -m fast'
    alias show-pg-status='pg_ctl status'
    alias restart-pg='pg_ctl reload'
    #POSTGRESQL - END
  ```
- automake `brew install automake`
- libtool `brew install libtool`
- gcc `brew install gcc`
- gmp `brew install gmp`
- asdf `brew install asdf`. /// make sure asdf install correctly in your path.
    update bashrc file with below line
    ```
      . /opt/homebrew/opt/asdf/libexec/asdf.sh
    ```
- install erlang, nodejs, elixir, add asdf plugin and then do install from root.
  ```
    asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git\

    asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git\

    asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git\

    asdf install

    // update bash profile or path

    export PATH="/opt/homebrew/opt/node@14/bin:$PATH"
    export PATH="/opt/homebrew/opt/erlang@23/bin:$PATH"
    export LDFLAGS="-L/opt/homebrew/opt/erlang@23/lib"
  ```
    
- install rustc 
    ``` curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh\ ```
    update bash profile with
    ```
        #==== rust config ====
        export PATH="$HOME/.cargo/bin:$PATH"
        export RUSTFLAGS="-C target-feature=-crt-static"
        #==== rust config end ====
    ```


## 2. Setup
1. start postgresql 
```
    pg-start // will work if above configuration has been setup in bashrc
```

## 3. Get Started
1. Set the current user permission to the project root.
  ``sudo chown -R $USER ./blockscout``
2. export the required variable `~./.start.sh`
    `updated the .start.sh content based on the requirement`
3. setup explorer
``` 
    cd apps/explorer
    mix do deps.get, local.rebar, deps.compile, compile    
    mix ecto.create && mix ecto.migrate
``` 
4. setup blockscout web
``` 
    cd apps/block_scout_web
    cd assets && npm install && cd ..
    mix phx.server // (This can be run from this directory or the project root: the project root is recommended.)

```
Now you can visit `http://localhost:4000/` from your browser.

