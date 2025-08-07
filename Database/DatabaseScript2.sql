-- Creating the table hitting_stats
create table hitting_stats(
player_name text primary key,
year integer,
at_bats integer,
hits integer,
home_runs integer,
batting_average real);

-- Creating a schema to move files into production
create schema production;

-- Moving the table from the public schema to production
alter table public.hitting_stats set schema production;