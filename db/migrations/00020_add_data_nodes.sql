-- +goose NO TRANSACTION
-- +goose Up
-- this is generated by a script
SELECT add_data_node('dn3', host => 'pg_data_node_3', port => 5432, database => 'vulcanize_testing_v4', password => 'password');
SELECT add_data_node('dn2', host => 'pg_data_node_2', port => 5432, database => 'vulcanize_testing_v4', password => 'password');
SELECT add_data_node('dn1', host => 'pg_data_node_1', port => 5432, database => 'vulcanize_testing_v4', password => 'password');

CALL distributed_exec($$ CREATE SCHEMA eth $$);

-- +goose Down
-- this is generated by a script
CALL distributed_exec($$ DROP SCHEMA eth $$);

SELECT delete_data_node('dn1', force => true, if_attached => true);
SELECT delete_data_node('dn2', force => true, if_attached => true);
SELECT delete_data_node('dn3', force => true, if_attached => true);
