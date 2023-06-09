# OpenAPI client server library for Erlang

## Overview

An Erlang client stub generated by [OpenAPI Generator](https://openapi-generator.tech) given the [OpenAPI spec](https://github.com/openai/openai-openapi).

## Example

```erlang
1> ApiKey = <<"sk-...">>,
   Host = <<"https://api.openai.com">>,
   HackneyOpts = [{recv_timeout, 30_000}],
   Opts = #{cfg => #{ api_key_prefix => #{ <<"Authorization">> => <<"Bearer">> }, auth => #{ api_key => ApiKey }, host => Host }, hackney_opts => HackneyOpts }),
   openai_open_ai_api:list_models(#{}, Opts).
...
{ok,#{data =>
          [#{created => 1649358449,id => <<"babbage">>,
             object => <<"model">>,owned_by => <<"openai">>,
             parent => null,
             permission =>
                 [#{allow_create_engine => false,allow_fine_tuning => false,
                    allow_logprobs => true,allow_sampling => true,
                    allow_search_indices => false,allow_view => true,
                    created => 1669085501,group => null,
                    id => <<"modelperm-49FUp5v084tBB49tC4z8LPH5">>,
                    is_blocking => false,object => <<"model_permission">>,
                    organization => <<"*">>}],
...
```
