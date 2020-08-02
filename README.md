# [Hyades](https://hyades.info)

[Hyades](http://hyades.info) is a weekly newsletter containing a summary of everything that happened in your starred Github repos.

![Newsletter sample](/assets/static/images/sshot.jpg)

## Why?

I developed Hyades to follow all the Github projects I want to keep an eye on, but which would clutter my notifications & inbox if I watched every single on of them. As a comfortable middle-ground, Hyades will deliver a (customisable) quick rundown of everything of importance every Monday morning.

## Development

Hyades is developed on the [OTP](https://erlang.org/doc/design_principles/users_guide.html) with [Elixir](https://elixir-lang.org/) using the [Phoenix framework](https://www.phoenixframework.org/). All dependencies are listed in the [Mix file](mix.exs).

To start hacking on your own Hyades instance:

  * Configure your database secrets in `config/dev.exs`
  * Setup the project with `mix setup`
  * Install the JS buils pipeline with `npm install --prefix ./assets`
  * Start Phoenix endpoint with `mix phx.server`

You can now visit [`localhost:4000`](http://localhost:4000) from your browser.

## Deployment

Hyades is deployed like any other Phoenix application. You will have to fill your secrets in `config/prod.secret.exs`, then follow the [Pow production checklist](https://hexdocs.pm/pow/production_checklist.html#content) and the [Phoenix deployment guide](https://hexdocs.pm/phoenix/deployment.html).

## License

Hyades is developed & distributed under the [CeCILL-C](https://en.wikipedia.org/wiki/CeCILL) license (LGPL-compatible).
