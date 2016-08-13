desc 'security test'
task security: :environment do
  system('bundle exec brakeman -z')
end
