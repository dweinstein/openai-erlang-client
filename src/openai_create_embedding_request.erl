-module(openai_create_embedding_request).

-export([encode/1]).

-export_type([openai_create_embedding_request/0]).

-type openai_create_embedding_request() ::
    #{ 'model' := binary(),
       'input' := openai_create_embedding_request_input:openai_create_embedding_request_input(),
       'user' => binary()
     }.

encode(#{ 'model' := Model,
          'input' := Input,
          'user' := User
        }) ->
    #{ 'model' => Model,
       'input' => Input,
       'user' => User
     }.
