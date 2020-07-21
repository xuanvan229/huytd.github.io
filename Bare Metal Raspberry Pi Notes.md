#rust #hardware #raspberry-pi

**VideoCore** is a low-power processor on Raspberry Pi to handle multimedia stuff, some document mentioned it as a GPU of the board. It also supported OpenGL ES.

Raspberry Pi 4 uses VideoCore VI processor, and it can handle textures as large as 7680x7680 pixels.

Reference: https://elinux.org/Raspberry_Pi_VideoCore_APIs

---

**Mailboxes** are the communication mechanism between the processor and VideoCore. There are two mailboxes on a Pi, call it `M0` (to handle communication from VideoCore to processor) and `M1` (for the other way).

Each mailbox has many **virtual channels**. For example, for framebuffer, LEDs, buttons, touch screen,...

Reference: https://github.com/raspberrypi/documentation/tree/JamesH65-mailbox_docs/configuration/mailboxes

---

To use QEMU to setup a Raspberry Pi emulator:

Reference:
- [Emulate Raspberry Pi with QEMU](https://azeria-labs.com/emulate-raspberry-pi-with-qemu/)
- [Using QEMU to emulate a Raspberry Pi](https://blog.agchapman.com/using-qemu-to-emulate-a-raspberry-pi/)

---

To compile Rust for bare metal Raspberry Pi, we need to use `arm-unknown-linux-gnueabihf` target.

```rust
$ rustup target add arm-unknown-linux-gnueabihf
```

---

Since we're not directly compile our code to a binary, we should point it out in the code:

```rust
#![crate_type = "staticlib"]
```

In the linker process, there's also a function that needed, so we're required to do something like:

```rust
#[no_mangle]
pub extern fn __aeabi_unwind_cpp_pr0() {}
```

More on this later

---

Some good resources to get started with bare metal programming:

Reference:
- [Raspberry Pi 3 Bare Metal - Part 1](https://adamransom.github.io/posts/raspberry-pi-bare-metal-part-1.html)
- [Raspberry Pi 3 Bare Metal in Rust](https://zhuohua.me/post/raspberry-pi-3-bare-metal-in-rust/)
- [seankerr/rust-rpi-examples](https://github.com/seankerr/rust-rpi-examples)