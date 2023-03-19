-module(openai_create_classification_request).

-export([encode/1]).

-export_type([openai_create_classification_request/0]).

-type openai_create_classification_request() ::
    #{ 'model' := binary(),
       'query' := binary(),
       'examples' => list(),
       'file' => binary(),
       'labels' => list(),
       'search_model' => binary(),
       'temperature' => integer(),
       'logprobs' => integer(),
       'max_examples' => integer(),
       'logit_bias' => maps:map(),
       'return_prompt' => boolean(),
       'return_metadata' => boolean(),
       'expand' => list(),
       'user' => binary()
     }.

encode(#{ 'model' := Model,
          'query' := Query,
          'examples' := Examples,
          'file' := File,
          'labels' := Labels,
          'search_model' := SearchModel,
          'temperature' := Temperature,
          'logprobs' := Logprobs,
          'max_examples' := MaxExamples,
          'logit_bias' := LogitBias,
          'return_prompt' := ReturnPrompt,
          'return_metadata' := ReturnMetadata,
          'expand' := Expand,
          'user' := User
        }) ->
    #{ 'model' => Model,
       'query' => Query,
       'examples' => Examples,
       'file' => File,
       'labels' => Labels,
       'search_model' => SearchModel,
       'temperature' => Temperature,
       'logprobs' => Logprobs,
       'max_examples' => MaxExamples,
       'logit_bias' => LogitBias,
       'return_prompt' => ReturnPrompt,
       'return_metadata' => ReturnMetadata,
       'expand' => Expand,
       'user' => User
     }.
