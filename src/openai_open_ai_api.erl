-module(openai_open_ai_api).

-export([cancel_fine_tune/2, cancel_fine_tune/3,
         create_answer/2, create_answer/3,
         create_chat_completion/2, create_chat_completion/3,
         create_classification/2, create_classification/3,
         create_completion/2, create_completion/3,
         create_edit/2, create_edit/3,
         create_embedding/2, create_embedding/3,
         create_file/3, create_file/4,
         create_fine_tune/2, create_fine_tune/3,
         create_image/2, create_image/3,
         create_image_edit/3, create_image_edit/4,
         create_image_variation/2, create_image_variation/3,
         create_moderation/2, create_moderation/3,
         create_search/3, create_search/4,
         create_transcription/3, create_transcription/4,
         create_translation/3, create_translation/4,
         delete_file/2, delete_file/3,
         delete_model/2, delete_model/3,
         download_file/2, download_file/3,
         list_engines/1, list_engines/2,
         list_files/1, list_files/2,
         list_fine_tune_events/2, list_fine_tune_events/3,
         list_fine_tunes/1, list_fine_tunes/2,
         list_models/1, list_models/2,
         retrieve_engine/2, retrieve_engine/3,
         retrieve_file/2, retrieve_file/3,
         retrieve_fine_tune/2, retrieve_fine_tune/3,
         retrieve_model/2, retrieve_model/3]).

-define(BASE_URL, <<"/v1">>).

%% @doc Immediately cancel a fine-tune job. 
%% 
-spec cancel_fine_tune(ctx:ctx(), binary()) -> {ok, openai_fine_tune:openai_fine_tune(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
cancel_fine_tune(Ctx, FineTuneId) ->
    cancel_fine_tune(Ctx, FineTuneId, #{}).

-spec cancel_fine_tune(ctx:ctx(), binary(), maps:map()) -> {ok, openai_fine_tune:openai_fine_tune(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
cancel_fine_tune(Ctx, FineTuneId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(openai_api, config, #{})),

    Method = post,
    Path = [?BASE_URL, "/fine-tunes/", FineTuneId, "/cancel"],
    QS = [],
    Headers = []++openai_utils:optional_params(['OpenAI-Organization'], _OptionalParams),
    Body1 = [],
    ContentTypeHeader = openai_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openai_utils:request(Ctx, Method, Path, QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Answers the specified question using the provided documents and examples.  The endpoint first [searches](/docs/api-reference/searches) over provided documents or files to find relevant context. The relevant context is combined with the provided examples and question to create the prompt for [completion](/docs/api-reference/completions). 
%% 
-spec create_answer(ctx:ctx(), openai_create_answer_request:openai_create_answer_request()) -> {ok, openai_create_answer_response:openai_create_answer_response(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
create_answer(Ctx, OpenaiCreateAnswerRequest) ->
    create_answer(Ctx, OpenaiCreateAnswerRequest, #{}).

-spec create_answer(ctx:ctx(), openai_create_answer_request:openai_create_answer_request(), maps:map()) -> {ok, openai_create_answer_response:openai_create_answer_response(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
create_answer(Ctx, OpenaiCreateAnswerRequest, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(openai_api, config, #{})),

    Method = post,
    Path = [?BASE_URL, "/answers"],
    QS = [],
    Headers = []++openai_utils:optional_params(['OpenAI-Organization'], _OptionalParams),
    Body1 = OpenaiCreateAnswerRequest,
    ContentTypeHeader = openai_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openai_utils:request(Ctx, Method, Path, QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Creates a completion for the chat message
%% 
-spec create_chat_completion(ctx:ctx(), openai_create_chat_completion_request:openai_create_chat_completion_request()) -> {ok, openai_create_chat_completion_response:openai_create_chat_completion_response(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
create_chat_completion(Ctx, OpenaiCreateChatCompletionRequest) ->
    create_chat_completion(Ctx, OpenaiCreateChatCompletionRequest, #{}).

-spec create_chat_completion(ctx:ctx(), openai_create_chat_completion_request:openai_create_chat_completion_request(), maps:map()) -> {ok, openai_create_chat_completion_response:openai_create_chat_completion_response(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
create_chat_completion(Ctx, OpenaiCreateChatCompletionRequest, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(openai_api, config, #{})),

    Method = post,
    Path = [?BASE_URL, "/chat/completions"],
    QS = [],
    Headers = []++openai_utils:optional_params(['OpenAI-Organization'], _OptionalParams),
    Body1 = OpenaiCreateChatCompletionRequest,
    ContentTypeHeader = openai_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openai_utils:request(Ctx, Method, Path, QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Classifies the specified `query` using provided examples.  The endpoint first [searches](/docs/api-reference/searches) over the labeled examples to select the ones most relevant for the particular query. Then, the relevant examples are combined with the query to construct a prompt to produce the final label via the [completions](/docs/api-reference/completions) endpoint.  Labeled examples can be provided via an uploaded `file`, or explicitly listed in the request using the `examples` parameter for quick tests and small scale use cases. 
%% 
-spec create_classification(ctx:ctx(), openai_create_classification_request:openai_create_classification_request()) -> {ok, openai_create_classification_response:openai_create_classification_response(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
create_classification(Ctx, OpenaiCreateClassificationRequest) ->
    create_classification(Ctx, OpenaiCreateClassificationRequest, #{}).

-spec create_classification(ctx:ctx(), openai_create_classification_request:openai_create_classification_request(), maps:map()) -> {ok, openai_create_classification_response:openai_create_classification_response(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
create_classification(Ctx, OpenaiCreateClassificationRequest, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(openai_api, config, #{})),

    Method = post,
    Path = [?BASE_URL, "/classifications"],
    QS = [],
    Headers = []++openai_utils:optional_params(['OpenAI-Organization'], _OptionalParams),
    Body1 = OpenaiCreateClassificationRequest,
    ContentTypeHeader = openai_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openai_utils:request(Ctx, Method, Path, QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Creates a completion for the provided prompt and parameters
%% 
-spec create_completion(ctx:ctx(), openai_create_completion_request:openai_create_completion_request()) -> {ok, openai_create_completion_response:openai_create_completion_response(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
create_completion(Ctx, OpenaiCreateCompletionRequest) ->
    create_completion(Ctx, OpenaiCreateCompletionRequest, #{}).

-spec create_completion(ctx:ctx(), openai_create_completion_request:openai_create_completion_request(), maps:map()) -> {ok, openai_create_completion_response:openai_create_completion_response(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
create_completion(Ctx, OpenaiCreateCompletionRequest, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(openai_api, config, #{})),

    Method = post,
    Path = [?BASE_URL, "/completions"],
    QS = [],
    Headers = []++openai_utils:optional_params(['OpenAI-Organization'], _OptionalParams),
    Body1 = OpenaiCreateCompletionRequest,
    ContentTypeHeader = openai_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openai_utils:request(Ctx, Method, Path, QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Creates a new edit for the provided input, instruction, and parameters.
%% 
-spec create_edit(ctx:ctx(), openai_create_edit_request:openai_create_edit_request()) -> {ok, openai_create_edit_response:openai_create_edit_response(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
create_edit(Ctx, OpenaiCreateEditRequest) ->
    create_edit(Ctx, OpenaiCreateEditRequest, #{}).

-spec create_edit(ctx:ctx(), openai_create_edit_request:openai_create_edit_request(), maps:map()) -> {ok, openai_create_edit_response:openai_create_edit_response(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
create_edit(Ctx, OpenaiCreateEditRequest, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(openai_api, config, #{})),

    Method = post,
    Path = [?BASE_URL, "/edits"],
    QS = [],
    Headers = []++openai_utils:optional_params(['OpenAI-Organization'], _OptionalParams),
    Body1 = OpenaiCreateEditRequest,
    ContentTypeHeader = openai_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openai_utils:request(Ctx, Method, Path, QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Creates an embedding vector representing the input text.
%% 
-spec create_embedding(ctx:ctx(), openai_create_embedding_request:openai_create_embedding_request()) -> {ok, openai_create_embedding_response:openai_create_embedding_response(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
create_embedding(Ctx, OpenaiCreateEmbeddingRequest) ->
    create_embedding(Ctx, OpenaiCreateEmbeddingRequest, #{}).

-spec create_embedding(ctx:ctx(), openai_create_embedding_request:openai_create_embedding_request(), maps:map()) -> {ok, openai_create_embedding_response:openai_create_embedding_response(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
create_embedding(Ctx, OpenaiCreateEmbeddingRequest, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(openai_api, config, #{})),

    Method = post,
    Path = [?BASE_URL, "/embeddings"],
    QS = [],
    Headers = []++openai_utils:optional_params(['OpenAI-Organization'], _OptionalParams),
    Body1 = OpenaiCreateEmbeddingRequest,
    ContentTypeHeader = openai_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openai_utils:request(Ctx, Method, Path, QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Upload a file that contains document(s) to be used across various endpoints/features. Currently, the size of all the files uploaded by one organization can be up to 1 GB. Please contact us if you need to increase the storage limit. 
%% 
-spec create_file(ctx:ctx(), binary(), binary()) -> {ok, openai_open_ai_file:openai_open_ai_file(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
create_file(Ctx, File, Purpose) ->
    create_file(Ctx, File, Purpose, #{}).

-spec create_file(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, openai_open_ai_file:openai_open_ai_file(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
create_file(Ctx, File, Purpose, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(openai_api, config, #{})),

    Method = post,
    Path = [?BASE_URL, "/files"],
    QS = [],
    Headers = []++openai_utils:optional_params(['OpenAI-Organization'], _OptionalParams),
    Body1 = {form, [{<<"file">>, File}, {<<"purpose">>, Purpose}]++openai_utils:optional_params([], _OptionalParams)},
    ContentTypeHeader = openai_utils:select_header_content_type([<<"multipart/form-data">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openai_utils:request(Ctx, Method, Path, QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Creates a job that fine-tunes a specified model from a given dataset.  Response includes details of the enqueued job including job status and the name of the fine-tuned models once complete.  [Learn more about Fine-tuning](/docs/guides/fine-tuning) 
%% 
-spec create_fine_tune(ctx:ctx(), openai_create_fine_tune_request:openai_create_fine_tune_request()) -> {ok, openai_fine_tune:openai_fine_tune(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
create_fine_tune(Ctx, OpenaiCreateFineTuneRequest) ->
    create_fine_tune(Ctx, OpenaiCreateFineTuneRequest, #{}).

-spec create_fine_tune(ctx:ctx(), openai_create_fine_tune_request:openai_create_fine_tune_request(), maps:map()) -> {ok, openai_fine_tune:openai_fine_tune(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
create_fine_tune(Ctx, OpenaiCreateFineTuneRequest, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(openai_api, config, #{})),

    Method = post,
    Path = [?BASE_URL, "/fine-tunes"],
    QS = [],
    Headers = []++openai_utils:optional_params(['OpenAI-Organization'], _OptionalParams),
    Body1 = OpenaiCreateFineTuneRequest,
    ContentTypeHeader = openai_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openai_utils:request(Ctx, Method, Path, QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Creates an image given a prompt.
%% 
-spec create_image(ctx:ctx(), openai_create_image_request:openai_create_image_request()) -> {ok, openai_images_response:openai_images_response(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
create_image(Ctx, OpenaiCreateImageRequest) ->
    create_image(Ctx, OpenaiCreateImageRequest, #{}).

-spec create_image(ctx:ctx(), openai_create_image_request:openai_create_image_request(), maps:map()) -> {ok, openai_images_response:openai_images_response(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
create_image(Ctx, OpenaiCreateImageRequest, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(openai_api, config, #{})),

    Method = post,
    Path = [?BASE_URL, "/images/generations"],
    QS = [],
    Headers = []++openai_utils:optional_params(['OpenAI-Organization'], _OptionalParams),
    Body1 = OpenaiCreateImageRequest,
    ContentTypeHeader = openai_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openai_utils:request(Ctx, Method, Path, QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Creates an edited or extended image given an original image and a prompt.
%% 
-spec create_image_edit(ctx:ctx(), binary(), binary()) -> {ok, openai_images_response:openai_images_response(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
create_image_edit(Ctx, Image, Prompt) ->
    create_image_edit(Ctx, Image, Prompt, #{}).

-spec create_image_edit(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, openai_images_response:openai_images_response(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
create_image_edit(Ctx, Image, Prompt, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(openai_api, config, #{})),

    Method = post,
    Path = [?BASE_URL, "/images/edits"],
    QS = [],
    Headers = []++openai_utils:optional_params(['OpenAI-Organization'], _OptionalParams),
    Body1 = {form, [{<<"image">>, Image}, {<<"prompt">>, Prompt}]++openai_utils:optional_params(['mask', 'n', 'size', 'response_format', 'user'], _OptionalParams)},
    ContentTypeHeader = openai_utils:select_header_content_type([<<"multipart/form-data">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openai_utils:request(Ctx, Method, Path, QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Creates a variation of a given image.
%% 
-spec create_image_variation(ctx:ctx(), binary()) -> {ok, openai_images_response:openai_images_response(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
create_image_variation(Ctx, Image) ->
    create_image_variation(Ctx, Image, #{}).

-spec create_image_variation(ctx:ctx(), binary(), maps:map()) -> {ok, openai_images_response:openai_images_response(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
create_image_variation(Ctx, Image, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(openai_api, config, #{})),

    Method = post,
    Path = [?BASE_URL, "/images/variations"],
    QS = [],
    Headers = []++openai_utils:optional_params(['OpenAI-Organization'], _OptionalParams),
    Body1 = {form, [{<<"image">>, Image}]++openai_utils:optional_params(['n', 'size', 'response_format', 'user'], _OptionalParams)},
    ContentTypeHeader = openai_utils:select_header_content_type([<<"multipart/form-data">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openai_utils:request(Ctx, Method, Path, QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Classifies if text violates OpenAI's Content Policy
%% 
-spec create_moderation(ctx:ctx(), openai_create_moderation_request:openai_create_moderation_request()) -> {ok, openai_create_moderation_response:openai_create_moderation_response(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
create_moderation(Ctx, OpenaiCreateModerationRequest) ->
    create_moderation(Ctx, OpenaiCreateModerationRequest, #{}).

-spec create_moderation(ctx:ctx(), openai_create_moderation_request:openai_create_moderation_request(), maps:map()) -> {ok, openai_create_moderation_response:openai_create_moderation_response(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
create_moderation(Ctx, OpenaiCreateModerationRequest, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(openai_api, config, #{})),

    Method = post,
    Path = [?BASE_URL, "/moderations"],
    QS = [],
    Headers = []++openai_utils:optional_params(['OpenAI-Organization'], _OptionalParams),
    Body1 = OpenaiCreateModerationRequest,
    ContentTypeHeader = openai_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openai_utils:request(Ctx, Method, Path, QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc The search endpoint computes similarity scores between provided query and documents. Documents can be passed directly to the API if there are no more than 200 of them.  To go beyond the 200 document limit, documents can be processed offline and then used for efficient retrieval at query time. When `file` is set, the search endpoint searches over all the documents in the given file and returns up to the `max_rerank` number of documents. These documents will be returned along with their search scores.  The similarity score is a positive score that usually ranges from 0 to 300 (but can sometimes go higher), where a score above 200 usually means the document is semantically similar to the query. 
%% 
-spec create_search(ctx:ctx(), binary(), openai_create_search_request:openai_create_search_request()) -> {ok, openai_create_search_response:openai_create_search_response(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
create_search(Ctx, EngineId, OpenaiCreateSearchRequest) ->
    create_search(Ctx, EngineId, OpenaiCreateSearchRequest, #{}).

-spec create_search(ctx:ctx(), binary(), openai_create_search_request:openai_create_search_request(), maps:map()) -> {ok, openai_create_search_response:openai_create_search_response(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
create_search(Ctx, EngineId, OpenaiCreateSearchRequest, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(openai_api, config, #{})),

    Method = post,
    Path = [?BASE_URL, "/engines/", EngineId, "/search"],
    QS = [],
    Headers = []++openai_utils:optional_params(['OpenAI-Organization'], _OptionalParams),
    Body1 = OpenaiCreateSearchRequest,
    ContentTypeHeader = openai_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openai_utils:request(Ctx, Method, Path, QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Transcribes audio into the input language.
%% 
-spec create_transcription(ctx:ctx(), binary(), binary()) -> {ok, openai_create_transcription_response:openai_create_transcription_response(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
create_transcription(Ctx, File, Model) ->
    create_transcription(Ctx, File, Model, #{}).

-spec create_transcription(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, openai_create_transcription_response:openai_create_transcription_response(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
create_transcription(Ctx, File, Model, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(openai_api, config, #{})),

    Method = post,
    Path = [?BASE_URL, "/audio/transcriptions"],
    QS = [],
    Headers = []++openai_utils:optional_params(['OpenAI-Organization'], _OptionalParams),
    Body1 = {form, [{<<"file">>, File}, {<<"model">>, Model}]++openai_utils:optional_params(['prompt', 'response_format', 'temperature', 'language'], _OptionalParams)},
    ContentTypeHeader = openai_utils:select_header_content_type([<<"multipart/form-data">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openai_utils:request(Ctx, Method, Path, QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Translates audio into into English.
%% 
-spec create_translation(ctx:ctx(), binary(), binary()) -> {ok, openai_create_translation_response:openai_create_translation_response(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
create_translation(Ctx, File, Model) ->
    create_translation(Ctx, File, Model, #{}).

-spec create_translation(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, openai_create_translation_response:openai_create_translation_response(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
create_translation(Ctx, File, Model, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(openai_api, config, #{})),

    Method = post,
    Path = [?BASE_URL, "/audio/translations"],
    QS = [],
    Headers = []++openai_utils:optional_params(['OpenAI-Organization'], _OptionalParams),
    Body1 = {form, [{<<"file">>, File}, {<<"model">>, Model}]++openai_utils:optional_params(['prompt', 'response_format', 'temperature'], _OptionalParams)},
    ContentTypeHeader = openai_utils:select_header_content_type([<<"multipart/form-data">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openai_utils:request(Ctx, Method, Path, QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Delete a file.
%% 
-spec delete_file(ctx:ctx(), binary()) -> {ok, openai_delete_file_response:openai_delete_file_response(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
delete_file(Ctx, FileId) ->
    delete_file(Ctx, FileId, #{}).

-spec delete_file(ctx:ctx(), binary(), maps:map()) -> {ok, openai_delete_file_response:openai_delete_file_response(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
delete_file(Ctx, FileId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(openai_api, config, #{})),

    Method = delete,
    Path = [?BASE_URL, "/files/", FileId, ""],
    QS = [],
    Headers = []++openai_utils:optional_params(['OpenAI-Organization'], _OptionalParams),
    Body1 = [],
    ContentTypeHeader = openai_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openai_utils:request(Ctx, Method, Path, QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Delete a fine-tuned model. You must have the Owner role in your organization.
%% 
-spec delete_model(ctx:ctx(), binary()) -> {ok, openai_delete_model_response:openai_delete_model_response(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
delete_model(Ctx, Model) ->
    delete_model(Ctx, Model, #{}).

-spec delete_model(ctx:ctx(), binary(), maps:map()) -> {ok, openai_delete_model_response:openai_delete_model_response(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
delete_model(Ctx, Model, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(openai_api, config, #{})),

    Method = delete,
    Path = [?BASE_URL, "/models/", Model, ""],
    QS = [],
    Headers = []++openai_utils:optional_params(['OpenAI-Organization'], _OptionalParams),
    Body1 = [],
    ContentTypeHeader = openai_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openai_utils:request(Ctx, Method, Path, QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Returns the contents of the specified file
%% 
-spec download_file(ctx:ctx(), binary()) -> {ok, binary(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
download_file(Ctx, FileId) ->
    download_file(Ctx, FileId, #{}).

-spec download_file(ctx:ctx(), binary(), maps:map()) -> {ok, binary(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
download_file(Ctx, FileId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(openai_api, config, #{})),

    Method = get,
    Path = [?BASE_URL, "/files/", FileId, "/content"],
    QS = [],
    Headers = []++openai_utils:optional_params(['OpenAI-Organization'], _OptionalParams),
    Body1 = [],
    ContentTypeHeader = openai_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openai_utils:request(Ctx, Method, Path, QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Lists the currently available (non-finetuned) models, and provides basic information about each one such as the owner and availability.
%% 
-spec list_engines(ctx:ctx()) -> {ok, openai_list_engines_response:openai_list_engines_response(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
list_engines(Ctx) ->
    list_engines(Ctx, #{}).

-spec list_engines(ctx:ctx(), maps:map()) -> {ok, openai_list_engines_response:openai_list_engines_response(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
list_engines(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(openai_api, config, #{})),

    Method = get,
    Path = [?BASE_URL, "/engines"],
    QS = [],
    Headers = []++openai_utils:optional_params(['OpenAI-Organization'], _OptionalParams),
    Body1 = [],
    ContentTypeHeader = openai_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openai_utils:request(Ctx, Method, Path, QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Returns a list of files that belong to the user's organization.
%% 
-spec list_files(ctx:ctx()) -> {ok, openai_list_files_response:openai_list_files_response(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
list_files(Ctx) ->
    list_files(Ctx, #{}).

-spec list_files(ctx:ctx(), maps:map()) -> {ok, openai_list_files_response:openai_list_files_response(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
list_files(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(openai_api, config, #{})),

    Method = get,
    Path = [?BASE_URL, "/files"],
    QS = [],
    Headers = []++openai_utils:optional_params(['OpenAI-Organization'], _OptionalParams),
    Body1 = [],
    ContentTypeHeader = openai_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openai_utils:request(Ctx, Method, Path, QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get fine-grained status updates for a fine-tune job. 
%% 
-spec list_fine_tune_events(ctx:ctx(), binary()) -> {ok, openai_list_fine_tune_events_response:openai_list_fine_tune_events_response(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
list_fine_tune_events(Ctx, FineTuneId) ->
    list_fine_tune_events(Ctx, FineTuneId, #{}).

-spec list_fine_tune_events(ctx:ctx(), binary(), maps:map()) -> {ok, openai_list_fine_tune_events_response:openai_list_fine_tune_events_response(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
list_fine_tune_events(Ctx, FineTuneId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(openai_api, config, #{})),

    Method = get,
    Path = [?BASE_URL, "/fine-tunes/", FineTuneId, "/events"],
    QS = lists:flatten([])++openai_utils:optional_params(['stream'], _OptionalParams),
    Headers = []++openai_utils:optional_params(['OpenAI-Organization'], _OptionalParams),
    Body1 = [],
    ContentTypeHeader = openai_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openai_utils:request(Ctx, Method, Path, QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc List your organization's fine-tuning jobs 
%% 
-spec list_fine_tunes(ctx:ctx()) -> {ok, openai_list_fine_tunes_response:openai_list_fine_tunes_response(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
list_fine_tunes(Ctx) ->
    list_fine_tunes(Ctx, #{}).

-spec list_fine_tunes(ctx:ctx(), maps:map()) -> {ok, openai_list_fine_tunes_response:openai_list_fine_tunes_response(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
list_fine_tunes(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(openai_api, config, #{})),

    Method = get,
    Path = [?BASE_URL, "/fine-tunes"],
    QS = [],
    Headers = []++openai_utils:optional_params(['OpenAI-Organization'], _OptionalParams),
    Body1 = [],
    ContentTypeHeader = openai_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openai_utils:request(Ctx, Method, Path, QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Lists the currently available models, and provides basic information about each one such as the owner and availability.
%% 
-spec list_models(ctx:ctx()) -> {ok, openai_list_models_response:openai_list_models_response(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
list_models(Ctx) ->
    list_models(Ctx, #{}).

-spec list_models(ctx:ctx(), maps:map()) -> {ok, openai_list_models_response:openai_list_models_response(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
list_models(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(openai_api, config, #{})),

    Method = get,
    Path = [?BASE_URL, "/models"],
    QS = [],
    Headers = []++openai_utils:optional_params(['OpenAI-Organization'], _OptionalParams),
    Body1 = [],
    ContentTypeHeader = openai_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openai_utils:request(Ctx, Method, Path, QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Retrieves a model instance, providing basic information about it such as the owner and availability.
%% 
-spec retrieve_engine(ctx:ctx(), binary()) -> {ok, openai_engine:openai_engine(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
retrieve_engine(Ctx, EngineId) ->
    retrieve_engine(Ctx, EngineId, #{}).

-spec retrieve_engine(ctx:ctx(), binary(), maps:map()) -> {ok, openai_engine:openai_engine(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
retrieve_engine(Ctx, EngineId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(openai_api, config, #{})),

    Method = get,
    Path = [?BASE_URL, "/engines/", EngineId, ""],
    QS = [],
    Headers = []++openai_utils:optional_params(['OpenAI-Organization'], _OptionalParams),
    Body1 = [],
    ContentTypeHeader = openai_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openai_utils:request(Ctx, Method, Path, QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Returns information about a specific file.
%% 
-spec retrieve_file(ctx:ctx(), binary()) -> {ok, openai_open_ai_file:openai_open_ai_file(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
retrieve_file(Ctx, FileId) ->
    retrieve_file(Ctx, FileId, #{}).

-spec retrieve_file(ctx:ctx(), binary(), maps:map()) -> {ok, openai_open_ai_file:openai_open_ai_file(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
retrieve_file(Ctx, FileId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(openai_api, config, #{})),

    Method = get,
    Path = [?BASE_URL, "/files/", FileId, ""],
    QS = [],
    Headers = []++openai_utils:optional_params(['OpenAI-Organization'], _OptionalParams),
    Body1 = [],
    ContentTypeHeader = openai_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openai_utils:request(Ctx, Method, Path, QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Gets info about the fine-tune job.  [Learn more about Fine-tuning](/docs/guides/fine-tuning) 
%% 
-spec retrieve_fine_tune(ctx:ctx(), binary()) -> {ok, openai_fine_tune:openai_fine_tune(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
retrieve_fine_tune(Ctx, FineTuneId) ->
    retrieve_fine_tune(Ctx, FineTuneId, #{}).

-spec retrieve_fine_tune(ctx:ctx(), binary(), maps:map()) -> {ok, openai_fine_tune:openai_fine_tune(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
retrieve_fine_tune(Ctx, FineTuneId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(openai_api, config, #{})),

    Method = get,
    Path = [?BASE_URL, "/fine-tunes/", FineTuneId, ""],
    QS = [],
    Headers = []++openai_utils:optional_params(['OpenAI-Organization'], _OptionalParams),
    Body1 = [],
    ContentTypeHeader = openai_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openai_utils:request(Ctx, Method, Path, QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Retrieves a model instance, providing basic information about the model such as the owner and permissioning.
%% 
-spec retrieve_model(ctx:ctx(), binary()) -> {ok, openai_model:openai_model(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
retrieve_model(Ctx, Model) ->
    retrieve_model(Ctx, Model, #{}).

-spec retrieve_model(ctx:ctx(), binary(), maps:map()) -> {ok, openai_model:openai_model(), openai_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openai_utils:response_info()}.
retrieve_model(Ctx, Model, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(openai_api, config, #{})),

    Method = get,
    Path = [?BASE_URL, "/models/", Model, ""],
    QS = [],
    Headers = []++openai_utils:optional_params(['OpenAI-Organization'], _OptionalParams),
    Body1 = [],
    ContentTypeHeader = openai_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openai_utils:request(Ctx, Method, Path, QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).


