-module(openai_create_answer_response).

-export([encode/1]).

-export_type([openai_create_answer_response/0]).

-type openai_create_answer_response() ::
    #{ 'object' => binary(),
       'model' => binary(),
       'search_model' => binary(),
       'completion' => binary(),
       'answers' => list(),
       'selected_documents' => list()
     }.

encode(#{ 'object' := Object,
          'model' := Model,
          'search_model' := SearchModel,
          'completion' := Completion,
          'answers' := Answers,
          'selected_documents' := SelectedDocuments
        }) ->
    #{ 'object' => Object,
       'model' => Model,
       'search_model' => SearchModel,
       'completion' => Completion,
       'answers' => Answers,
       'selected_documents' => SelectedDocuments
     }.
