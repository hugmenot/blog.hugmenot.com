load 'deploy' if respond_to?(:namespace)
 
set :application, 'blog.hugmenot.com'
set :repository, 'git://github.com/hugmenot/blog.hugmenot.com.git'
set :use_sudo, false
set :deploy_to, "/var/www/#{application}"
set :scm, :git
set :deploy_via, :remote_cache
ssh_options[:forward_agent] = true
default_run_options[:pty] = true
 
role :web, 'blog.hugmenot.com'
 
namespace :deploy do
  task :restart do
  end
 
  task :start do
  end
 
  task :stop do
  end
  
  task :finalize_update do
  end

  desc 'Generates the site with Jekyll'
  task :generate do
    run "cd #{current_release} && rake jekyll"
  end
end
                                   
after 'deploy:update_code', 'deploy:generate'
