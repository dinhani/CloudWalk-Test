# Renato Dinhani <> CloudWalk

## File locations

The default input logfile is in `data/input`.

The generated JSON will be saved to `data/output`.

## Running the application

Using the default log file:

```ruby
ruby src/main.rb
```

Passing a custom log file as parameter:

```ruby
ruby src/main.rb path/to/log`
```

## General Architecture

The class organization is loosely based on DDD and Clean Architecture, even though interfaces are not necessary here because Ruby has duck typing.

The general idea of the script is to determine all the players that joined a match using their client IDs and keep track of all deaths that happened.

When requested, the array of death events is reduced to a single state to determine the number of kills by each player of each type of death.

### `domain`

Classes that represents the game structure and contains the rules for kills and players.

Classes in this layer are agnostic to the logfile or anything in the `infra` or `view` layer. They can be populated from any datasource like databases, REST APIs, tests or the logfile.

The class `Match` is the aggregate root for the entities represented in the domain.

### `infra`

Classes that interfaces with external systems like the logfile or a database.

Classes in this layer knows the `domain` classes and are responsible for creating the domain instances using aggregate roots.

### `view`

Classes that are responsible for formatting and presenting data, like converting a domain entity to JSON, XML or HTML.

### Clarifications

#### Report - Kills by player

* The keys in the JSON are sorted from the player with most kills to the one with less kills.

* All players that connected to the match are included in the response, even if the player did not kill and was not killed by anyone.

* Death by suicide like in the following example are not counted torward the kill count of the player or the match.

`8:13 Kill: 7 7 7: Assasinu Credi killed Assasinu Credi by MOD_ROCKET_SPLASH`

#### Report - Kills by type

* The keys in the JSON are sorted from the type with most kills to the one with less kills.

* All types are included in the report, even the ones that did not happen in the game.