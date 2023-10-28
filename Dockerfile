FROM elixir:latest
COPY . .
RUN mix deps.get && mix deps.compile 
EXPOSE 4369
