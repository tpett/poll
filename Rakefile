# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rake::TaskManager.class_eval do
  def alias_task(new_name, old_name)
    @tasks[new_name] = @tasks[old_name]
  end
end

def alias_task(*args)
  Rake.application.alias_task(*args)
end

Poll::Application.load_tasks
