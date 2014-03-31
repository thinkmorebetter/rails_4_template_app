# Source: http://michaeldwan.com/writings/customize-your-heroku-deployment.html
# Usage Example: rake deploy:production
require 'heroku'

# List of environments and their heroku git remotes
ENVIRONMENTS = {
  :production => 'production',
  :test       => 'testing',
  :staging    => 'staging'
}

namespace :deploy do
  ENVIRONMENTS.keys.each do |env|
    desc "Deploy to #{env}"
    task env, :branch do |t, args|
      current_branch = `git branch | grep ^* | awk '{ print $2 }'`.strip
      branch = args[:branch] ? args[:branch] : current_branch
      
      Rake::Task['deploy:before_deploy'].invoke(env, branch)
      Rake::Task['deploy:update_code'].invoke(env, branch)
      Rake::Task['deploy:after_deploy'].invoke(env, branch)
    end
  end

  task :before_deploy, :env, :branch do |t, args|
    puts "Deploying #{args[:branch]} to #{args[:env]}"
  end

  task :after_deploy, :env, :branch do |t, args|
    puts ""
    
    puts "Maintenance mode on for #{ENVIRONMENTS[args[:env]]}"
    puts %x{ heroku maintenance:on --remote #{ENVIRONMENTS[args[:env]]} }
    
    puts ""
    
    puts "Migrating db on #{ENVIRONMENTS[args[:env]]}"
    puts %x{ heroku run rake db:migrate --remote #{ENVIRONMENTS[args[:env]]} }
    
    puts ""
    
    puts "Maintenance mode off for #{ENVIRONMENTS[args[:env]]}"
    puts %x{ heroku maintenance:off --remote #{ENVIRONMENTS[args[:env]]} }
    
    puts ""
    
    puts "Clearing the cache on #{ENVIRONMENTS[args[:env]]}"
    puts %x{ heroku run rake cache:clear --remote #{ENVIRONMENTS[args[:env]]} }
    
    puts ""
    
    puts "Deployment Complete!"
  end

  task :update_code, :env, :branch do |t, args|
    FileUtils.cd Rails.root do
      puts "Executing: git push #{ENVIRONMENTS[args[:env]]} +#{args[:branch]}:master"
      `git push #{ENVIRONMENTS[args[:env]]} +#{args[:branch]}:master`
    end
  end
end