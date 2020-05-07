#!/bin/bash

export SECRET_KEY_BASE=sjkdh4q98n479bqn94879v8mq7v4ccq9n8t47bv9q8cn9487tqcnq94tntq9789t8q7b978bcq1ze7nb87234t2cnm

# Deploy script
mix deps.get --only prod
MIX_ENV=prod mix compile

#Compile assets
npm run deploy --prefix ./assets
mix phx.digest

PORT=4001 MIX_ENV=prod elixir --erl "-detached" -S mix phx.server
