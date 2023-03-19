-module(openai_create_answer_response_selected_documents_inner).

-export([encode/1]).

-export_type([openai_create_answer_response_selected_documents_inner/0]).

-type openai_create_answer_response_selected_documents_inner() ::
    #{ 'document' => integer(),
       'text' => binary()
     }.

encode(#{ 'document' := Document,
          'text' := Text
        }) ->
    #{ 'document' => Document,
       'text' => Text
     }.
