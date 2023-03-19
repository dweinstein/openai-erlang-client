-module(openai_create_chat_completion_request).

-export([encode/1]).

-export_type([openai_create_chat_completion_request/0]).

-type openai_create_chat_completion_request() ::
    #{ 'model' := binary(),
       'messages' := list(),
       'temperature' => integer(),
       'top_p' => integer(),
       'n' => integer(),
       'stream' => boolean(),
       'stop' => openai_create_chat_completion_request_stop:openai_create_chat_completion_request_stop(),
       'max_tokens' => integer(),
       'presence_penalty' => integer(),
       'frequency_penalty' => integer(),
       'logit_bias' => maps:map(),
       'user' => binary()
     }.

encode(#{ 'model' := Model,
          'messages' := Messages,
          'temperature' := Temperature,
          'top_p' := TopP,
          'n' := N,
          'stream' := Stream,
          'stop' := Stop,
          'max_tokens' := MaxTokens,
          'presence_penalty' := PresencePenalty,
          'frequency_penalty' := FrequencyPenalty,
          'logit_bias' := LogitBias,
          'user' := User
        }) ->
    #{ 'model' => Model,
       'messages' => Messages,
       'temperature' => Temperature,
       'top_p' => TopP,
       'n' => N,
       'stream' => Stream,
       'stop' => Stop,
       'max_tokens' => MaxTokens,
       'presence_penalty' => PresencePenalty,
       'frequency_penalty' => FrequencyPenalty,
       'logit_bias' => LogitBias,
       'user' => User
     }.
