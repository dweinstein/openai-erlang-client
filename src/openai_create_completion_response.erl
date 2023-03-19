-module(openai_create_completion_response).

-export([encode/1]).

-export_type([openai_create_completion_response/0]).

-type openai_create_completion_response() ::
    #{ 'id' := binary(),
       'object' := binary(),
       'created' := integer(),
       'model' := binary(),
       'choices' := list(),
       'usage' => openai_create_completion_response_usage:openai_create_completion_response_usage()
     }.

encode(#{ 'id' := Id,
          'object' := Object,
          'created' := Created,
          'model' := Model,
          'choices' := Choices,
          'usage' := Usage
        }) ->
    #{ 'id' => Id,
       'object' => Object,
       'created' => Created,
       'model' => Model,
       'choices' => Choices,
       'usage' => Usage
     }.
