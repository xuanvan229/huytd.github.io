#rust #webassembly

A Rust program can be compiled to WebAssembly as a library or a full runnable entry point (if the project type is binary).

To compile to WebAssembly, we need to have a wasm32 compile target:

```rust
$ rustup target add wasm32-unknown-unknown
```

For convenience, using [cargo-web](https://github.com/koute/cargo-web) seems like a widely accepted method:

```rust
$ cargo install cargo-web
```

And then, the actual compile and run:

```rust
$ cargo web start --target=wasm32-unknown-unknown
```
