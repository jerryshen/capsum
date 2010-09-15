require File.expand_path("../../capsum.rb", __FILE__)

Capistrano::Configuration.instance(true).load do
  namespace :whenever do
    desc 'Update the crontab'
    task :update do
      find_servers(:roles => :app).each do |server|
        whenever_settings = server.options[:whenever]
        if whenever_settings
          variables = whenever_settings.to_s
          if whenever_settings.is_a?(Hash)
            variables = whenever_settings.map{ |key, value| "#{key}=#{value}" }.join("&")
          end

          command = "if [ -e #{current_path}/config/schedule.rb ]; then cd #{current_path}; RAILS_ENV=#{rails_env} whenever --update-crontab #{application} --set %s; fi"
          run (command % variables), :hosts => server.host
        end
      end
    end
    
    desc 'Cleanup the crontab'
    task :cleanup, :roles => :app do
      run "if [ -e #{current_path}/config/schedule.rb ]; then cd #{current_path}; RAILS_ENV=#{rails_env} whenever --update-crontab #{application} --load-file /dev/null; fi"
    end
  end
  
  after "deploy:symlink", "whenever:update" 
end
