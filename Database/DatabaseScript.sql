-- Creating a role for database administrator
create role database_administrator with login password '3103' superuser;

-- Creating a role for etl user
create role etl_user with login password '1234';
grant connect on database cardinals_analysis to etl_user;
grant usage on schema production to etl_user;
grant insert, update on all tables in schema production to etl_user;
alter default privileges in schema production
grant insert, update on tables to etl_user;


-- Creating a role for data analyst
create role data_analyst with login password '5678';
grant connect on database cardinals_analysis to data_analyst;
grant usage on schema production to data_analyst;
grant select on all tables in schema production to data_analyst;
alter default privileges in schema production
grant select on tables to data_analyst;

-- Creating a role for a cardinals fan
create role cardinals_fan with login password '9376';
grant connect on database cardinals_analysis to cardinals_fan;
grant usage on schema production to cardinals_fan;
grant select on all tables in schema production to cardinals_fan;
alter role cardinals_fan inherit;
grant data_analyst to cardinals_fan;

-- Creating an index for player names
create index idx_hitting_stats_player_stats on production.hitting_stats(player_name);
