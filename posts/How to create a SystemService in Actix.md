#rust, #actix, #actor-model

In [[Actix Framework]], an actor can be registered as a service, which help it run automatically. There are two types of service, ArbiterService, which is unique per arbiter, and SystemService, which is unique per system.

In this note, we gonna focus on [SystemService](https://docs.rs/actix/0.10.0-alpha.3/src/actix/registry.rs.html#233-266).

An actor that want to be a service, need to implement `Default` trait, and of course, it must be an `Actor`:

```rust
#[derive(Default)]
struct ServerService;

impl Actor for ServerService {
	type Context = Context<Self>;
}
```

Then, we implement the `SystemService` trait, also, we need to implement `Supervised` trait to make sure this service will be automatically restart on failure.

```rust
impl SystemService for ServerService {}
impl Supervised for ServerService {}
```

---

Whenever we need to access the service, we can use `from_registry()` method, the usage is something like:

```rust
ServerService::from_registry()
	.send(SomeMessage{})
```

The return type of `from_registry()` is an `Addr`. For more details about how to handle `send` messages, see [[Notes on Actix ActorFuture]].
