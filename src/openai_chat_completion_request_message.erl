-module(openai_chat_completion_request_message).

-export([encode/1]).

-export_type([openai_chat_completion_request_message/0]).

-type openai_chat_completion_request_message() ::
    #{ 'role' := binary(),
       'content' := binary(),
       'name' => binary()
     }.

encode(#{ 'role' := Role,
          'content' := Content,
          'name' := Name
        }) ->
    #{ 'role' => Role,
       'content' => Content,
       'name' => Name
     }.
