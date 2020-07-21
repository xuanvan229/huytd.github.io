#How to create a Websocket Actor in Actix

#rust, #actix, #actor-model, #websocket

To handle WebSocket in [[Actix Framework]] you need to create a [WebSocket Actor](https://docs.rs/actix-web-actors/3.0.0-alpha.1/actix_web_actors/ws/index.html). Each actor will be responsible for each connected client.

```rust
#[derive(Default)]
struct WsSession;
```

A WebSocket actor have a `WebsocketContext` and need to implement `StreamHandler` trait.

```rust
impl Actor for WsSession {
	type Context = ws::WebsocketContext<Self>;
}

type WebsocketMessage = Result<ws::Message, ws::ProtocolError>;

impl StreamHandler<WebsocketMessage> for WsSession {
	fn handle(&mut self, msg: WebsocketMessage, ctx: &mut Self::Context) {
		...
  }
}
```

---

[WebsocketContext](https://docs.rs/actix-web-actors/3.0.0-alpha.1/actix_web_actors/ws/struct.WebsocketContext.html) is an Actix Context that has some special features such as handling `text` or `binary` messages, handling `ping` and `pong` messages.

The `handle` method of [StreamHandler](https://docs.rs/actix/0.10.0-alpha.3/actix/prelude/trait.StreamHandler.html) trait is where we process the incoming messages from the client. A [ws::Message](https://docs.rs/actix/0.10.0-alpha.3/actix/prelude/trait.StreamHandler.html) (not to be mistaken with Actor's messages) could be anything in Text or Binary or Ping/Pong.