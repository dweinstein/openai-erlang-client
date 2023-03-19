-module(openai_create_answer_request).

-export([encode/1]).

-export_type([openai_create_answer_request/0]).

-type openai_create_answer_request() ::
    #{ 'model' := binary(),
       'question' := binary(),
       'examples' := list(),
       'examples_context' := binary(),
       'documents' => list(),
       'file' => binary(),
       'search_model' => binary(),
       'max_rerank' => integer(),
       'temperature' => integer(),
       'logprobs' => integer(),
       'max_tokens' => integer(),
       'stop' => openai_create_answer_request_stop:openai_create_answer_request_stop(),
       'n' => integer(),
       'logit_bias' => maps:map(),
       'return_metadata' => boolean(),
       'return_prompt' => boolean(),
       'expand' => list(),
       'user' => binary()
     }.

encode(#{ 'model' := Model,
          'question' := Question,
          'examples' := Examples,
          'examples_context' := ExamplesContext,
          'documents' := Documents,
          'file' := File,
          'search_model' := SearchModel,
          'max_rerank' := MaxRerank,
          'temperature' := Temperature,
          'logprobs' := Logprobs,
          'max_tokens' := MaxTokens,
          'stop' := Stop,
          'n' := N,
          'logit_bias' := LogitBias,
          'return_metadata' := ReturnMetadata,
          'return_prompt' := ReturnPrompt,
          'expand' := Expand,
          'user' := User
        }) ->
    #{ 'model' => Model,
       'question' => Question,
       'examples' => Examples,
       'examples_context' => ExamplesContext,
       'documents' => Documents,
       'file' => File,
       'search_model' => SearchModel,
       'max_rerank' => MaxRerank,
       'temperature' => Temperature,
       'logprobs' => Logprobs,
       'max_tokens' => MaxTokens,
       'stop' => Stop,
       'n' => N,
       'logit_bias' => LogitBias,
       'return_metadata' => ReturnMetadata,
       'return_prompt' => ReturnPrompt,
       'expand' => Expand,
       'user' => User
     }.
