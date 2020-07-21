#rust #actor-model

Actix Framework is a Rust actor framework that help you build application using [[Actor Model]].

The Actix eco system are built on top of Actix, for example: Actix Web, Actix WebSocket.

To understand how actix crates works, you must understand how things works in Actix.

## Backlinks
* [[How to create a SystemService in Actix]]
	* In [[Actix Framework]], an actor can be registered as a service, which help it run automatically. There are two types of service, ArbiterService, which is unique per arbiter, and SystemService, which is unique per system.
* [[How to create a Websocket Actor in Actix]]
	* To handle WebSocket in [[Actix Framework]] you need to create a [WebSocket Actor](https://docs.rs/actix-web-actors/3.0.0-alpha.1/actix_web_actors/ws/index.html). Each actor will be responsible for each connected client.
* [[How to create an Actor in Actix]]
	* To create an Actor in [[Actix Framework]]) we first create a struct, then implement `Actor` trait for it. An actor has a `Context`, is where it run, and we can control the life cycle of it via the context.

