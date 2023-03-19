-module(openai_create_classification_response).

-export([encode/1]).

-export_type([openai_create_classification_response/0]).

-type openai_create_classification_response() ::
    #{ 'object' => binary(),
       'model' => binary(),
       'search_model' => binary(),
       'completion' => binary(),
       'label' => binary(),
       'selected_examples' => list()
     }.

encode(#{ 'object' := Object,
          'model' := Model,
          'search_model' := SearchModel,
          'completion' := Completion,
          'label' := Label,
          'selected_examples' := SelectedExamples
        }) ->
    #{ 'object' => Object,
       'model' => Model,
       'search_model' => SearchModel,
       'completion' => Completion,
       'label' => Label,
       'selected_examples' => SelectedExamples
     }.
