#rust, #actix, #actor-model 

First, [ActorFuture](https://docs.rs/actix/0.10.0-alpha.3/actix/fut/trait.ActorFuture.html) is Actix's version of future, it's not the traditional futures.

We run the ActorFuture by calling the `wait` method of its `Context`. This method will block the message stream, to prevent any further messages being processed until the current Message is finished processing.

I stumped upon a case where I need to send multiple messages in sequence, this kind of task can be done by using a normal future:

```rust
let fut = async move {
	Server::from_registry().send(MessageA{}).await?;
	Server::from_registry().send(MessageB{}).await
};
```

And then, convert the future into ActorFuture (because we need to use `wait` method), by doing either:

```rust
let run = fut.into_actor(self);
```

Or

```rust
let run = actix::fut::wrap_future::<_, Self>(fut);
```

After that, we can consume the ActorFuture just like how we do it for single message cases:

```rust
run.map(|result, actor, context} { ... }).wait(ctx);
```