create extension if not exists vector with schema public;

create table embedding (
  id bigint generated always as identity primary key,
  vector vector(1536) not null,
  input_text text not null,
  input_url text not null,
  usage_count bigint default 0 not null
);