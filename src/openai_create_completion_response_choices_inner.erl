-module(openai_create_completion_response_choices_inner).

-export([encode/1]).

-export_type([openai_create_completion_response_choices_inner/0]).

-type openai_create_completion_response_choices_inner() ::
    #{ 'text' => binary(),
       'index' => integer(),
       'logprobs' => openai_create_completion_response_choices_inner_logprobs:openai_create_completion_response_choices_inner_logprobs(),
       'finish_reason' => binary()
     }.

encode(#{ 'text' := Text,
          'index' := Index,
          'logprobs' := Logprobs,
          'finish_reason' := FinishReason
        }) ->
    #{ 'text' => Text,
       'index' => Index,
       'logprobs' => Logprobs,
       'finish_reason' => FinishReason
     }.
