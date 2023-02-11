FROM elixir:1.14-alpine AS build

ENV MIX_ENV=prod

WORKDIR /app

# get deps first so we have a cache
ADD mix.exs mix.lock /app/
RUN \
	cd /app && \
	mix local.hex --force && \
	mix local.rebar --force && \
	mix deps.get

# then make a release build
ADD . /app/
RUN \
	mix compile && \
	mix release

FROM elixir:1.14-alpine

COPY --from=build /app/_build/prod/rel/exchange_rate_api_9 /opt/exchange_rate_api_9

CMD [ "/opt/exchange_rate_api_9/bin/exchange_rate_api_9", "start" ]