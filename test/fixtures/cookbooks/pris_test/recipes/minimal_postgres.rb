postgresql_install 'postgres' do
  version '15'
  source 'repo'
  repo_pgdg true
  repo_pgdg_common true
  initdb_encoding 'UTF8'
  action %i(install init_server)
end

postgresql_config 'postgresql-server' do
  version '15'
  server_config({
    'autovacuum' => 'on',
    'checkpoint_timeout' => '15min',
    'shared_preload_libraries' => 'pg_stat_statements',
    'track_activities' => 'on',
    'track_counts' => 'on',
    'vacuum_cost_delay' => 50,
    'max_connections' => 160,
  })

  notifies :restart, 'postgresql_service[postgresql]', :delayed
  action :create
end

postgresql_service 'postgresql' do
  action %i(enable start)
  notifies :set_password, 'postgresql_user[postgres]', :immediately
end

postgresql_user 'postgres' do
  ignore_failure true # this fails after the password gets set initially
  unencrypted_password 'sergtsop'
  action :nothing
end

postgresql_user 'opennms' do
  password 'sergtsop'
  login true
  unencrypted_password 'opennms'
  superuser true
end

postgresql_database 'opennms' do
  password 'sergtsop'
  owner 'opennms'
end

%w(127.0.0.1/32 ::1/128).each do |h|
  postgresql_access "postgresql #{h} host access" do
    type 'host'
    database 'all'
    user 'all'
    address h
    auth_method 'scram-sha-256'
  end
  postgresql_access "remove host replication trust access from #{h}" do
    type 'host'
    database 'replication'
    user 'all'
    address h
    auth_method 'trust'
    action :delete
  end
end
postgresql_access 'remove local all trust' do
  type 'local'
  database 'all'
  user 'all'
  auth_method 'trust'
  action :delete
end
postgresql_access 'remove local replication trust' do
  type 'local'
  database 'replication'
  user 'all'
  auth_method 'trust'
  action :delete
end
postgresql_access 'add local scram' do
  type 'local'
  database 'all'
  user 'all'
  auth_method 'scram-sha-256'
end
