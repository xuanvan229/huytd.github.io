#How to create an Actor in Actix

#rust, #actix, #actor-model 

To create an Actor in [[Actix Framework]]) we first create a struct, then implement `Actor` trait for it. An actor has a `Context`, is where it run, and we can control the life cycle of it via the context.

```rust
struct MyActor;

impl Actor for MyActor {
	type Context = Context<Self>;
}
```

The lifecycle of an actor includes these states: **Started** -> **Running** -> **Stopping** -> **Stopped**. You can work with one of the lifecycle in your `Actor` implementation like this:

```rust
impl Actor for MyActor {
	type Context = Context<Self>;
	
	fn started(&mut self, ctx: &mut Context<Self>) {
		...
	}
}
```

Actors communicate with each other by exchanging messages, every message is a typed structure that implmement `Message` trait, and has a `rtype` to define its expected response type.

```rust
#[derive(Message)]
#[rtype(result = "i32")]
struct AddNumber(i32);
```

If you want your actor to be able to handle a certain message, implement `Handler` trait with that message. The implementation must describe the `Result` type, this is the return type that the message is expected.

```rust
impl Handler<AddNumber> for MyActor {
	type Result = i32;
	
	fn handle(&mut self, msg: AddNumber, ctx: &mut Self::Context) -> Self::Result {
		...
	}
}
```