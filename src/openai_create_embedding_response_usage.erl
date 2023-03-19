-module(openai_create_embedding_response_usage).

-export([encode/1]).

-export_type([openai_create_embedding_response_usage/0]).

-type openai_create_embedding_response_usage() ::
    #{ 'prompt_tokens' := integer(),
       'total_tokens' := integer()
     }.

encode(#{ 'prompt_tokens' := PromptTokens,
          'total_tokens' := TotalTokens
        }) ->
    #{ 'prompt_tokens' => PromptTokens,
       'total_tokens' => TotalTokens
     }.
