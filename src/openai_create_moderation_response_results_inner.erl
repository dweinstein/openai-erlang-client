-module(openai_create_moderation_response_results_inner).

-export([encode/1]).

-export_type([openai_create_moderation_response_results_inner/0]).

-type openai_create_moderation_response_results_inner() ::
    #{ 'flagged' := boolean(),
       'categories' := openai_create_moderation_response_results_inner_categories:openai_create_moderation_response_results_inner_categories(),
       'category_scores' := openai_create_moderation_response_results_inner_category_scores:openai_create_moderation_response_results_inner_category_scores()
     }.

encode(#{ 'flagged' := Flagged,
          'categories' := Categories,
          'category_scores' := CategoryScores
        }) ->
    #{ 'flagged' => Flagged,
       'categories' => Categories,
       'category_scores' => CategoryScores
     }.
