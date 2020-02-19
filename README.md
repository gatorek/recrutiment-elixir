# Gamecode

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix

# Google Api

This service uses Google Distance Matrix API. 
To get the API key, read: https://developers.google.com/maps/documentation/distance-matrix/get-api-key and follow the instructions.
Next, edit `config/config.exs` and put your API key into `config :gamecode, :google_api_key` section.

# Websocket notification

To receive notification about new trips via websocket, you should connect to URL `ws://localhost:4000/ws/event/websocket` and subscribe to channel `event:updates`.

You can look at example code in file: `assets/js/socket.js`.

# TODO

Important

- [ ] store float data (distance, price) as decimal or integer instead of float. use div rather, than "/"
- [ ] remove presentation layer from week and month stat services (rounding) - maybe move it to a separate service?
- [ ] return data according to specs
- [ ] improve testing - support current date in test data

Not so important

- [ ] use view to render json response (maybe?)
- [ ] use separate service to send WS messages
- [ ] remove home page (API only app)
