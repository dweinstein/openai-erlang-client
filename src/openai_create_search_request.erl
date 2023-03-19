-module(openai_create_search_request).

-export([encode/1]).

-export_type([openai_create_search_request/0]).

-type openai_create_search_request() ::
    #{ 'query' := binary(),
       'documents' => list(),
       'file' => binary(),
       'max_rerank' => integer(),
       'return_metadata' => boolean(),
       'user' => binary()
     }.

encode(#{ 'query' := Query,
          'documents' := Documents,
          'file' := File,
          'max_rerank' := MaxRerank,
          'return_metadata' := ReturnMetadata,
          'user' := User
        }) ->
    #{ 'query' => Query,
       'documents' => Documents,
       'file' => File,
       'max_rerank' => MaxRerank,
       'return_metadata' => ReturnMetadata,
       'user' => User
     }.
