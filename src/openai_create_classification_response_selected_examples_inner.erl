-module(openai_create_classification_response_selected_examples_inner).

-export([encode/1]).

-export_type([openai_create_classification_response_selected_examples_inner/0]).

-type openai_create_classification_response_selected_examples_inner() ::
    #{ 'document' => integer(),
       'text' => binary(),
       'label' => binary()
     }.

encode(#{ 'document' := Document,
          'text' := Text,
          'label' := Label
        }) ->
    #{ 'document' => Document,
       'text' => Text,
       'label' => Label
     }.
