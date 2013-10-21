namespace :db do

  desc 'Drop connections to this database so we can drop it'
  task :new_drop => :environment do
    ActiveRecord::Base.connection.execute %{
      SELECT
        pg_terminate_backend(pid)
      FROM
        pg_stat_activity
      WHERE -- don't kill my own connection!
        datname = '#{db_config['database']}' AND
        pid <> pg_backend_pid();
    }
    Rake::Task['db:old_drop'].invoke
  end
  alias_task 'db:old_drop', 'db:drop'
  alias_task 'db:drop', 'db:new_drop'

end

def db_config
  @config ||= YAML.load_file("config/database.yml")[ENV['RAILS_ENV'] || 'development']
end

def db_cmd_with_password(cmd, pw)
  `PGPASSWORD="#{pw}" #{cmd.join(" ")}`
end

