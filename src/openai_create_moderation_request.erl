-module(openai_create_moderation_request).

-export([encode/1]).

-export_type([openai_create_moderation_request/0]).

-type openai_create_moderation_request() ::
    #{ 'input' := openai_create_moderation_request_input:openai_create_moderation_request_input(),
       'model' => binary()
     }.

encode(#{ 'input' := Input,
          'model' := Model
        }) ->
    #{ 'input' => Input,
       'model' => Model
     }.
