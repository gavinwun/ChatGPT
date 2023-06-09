create or replace function vector_search(query_vector vector(1536), match_threshold float, match_count int, min_content_length int)
returns table (id bigint, input_text text, input_url text, usage_count bigint, similarity float)
language plpgsql
as $$
-- #variable_conflict use_variables
begin
  return query
  select
    embedding.id,
		embedding.input_text,
    embedding.input_url,
    embedding.usage_count,
    (embedding.vector <#> query_vector) * -1 as similarity
  from embedding

  -- We only care about sections that have a useful amount of content
  where length(embedding.input_text) >= min_content_length

  -- The dot product is negative because of a Postgres limitation, so we negate it
  and (embedding.vector <#> query_vector) * -1 > match_threshold
  order by embedding.vector <#> query_vector

  limit match_count;
end;
$$;