set :application, "reddylab.etl.luc.edu"
set :repository,  "git@github.com:rschmidt06/biodb.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :deploy_to, "/var/www"

role :web, "reddylab.etl.luc.edu"                          # Your HTTP server, Apache/etc
role :app, "reddylab.etl.luc.edu"                          # This may be the same as your `Web` server
role :db,  "reddylab.etl.luc.edu", :primary => true # This is where Rails migrations will run


# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end
