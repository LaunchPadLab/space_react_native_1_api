namespace :db do
  desc 'Drop, migrate and seed the database'
  task rebuild: :environment do
    puts 'Dropping database...'
    Rake::Task['db:drop'].invoke
    puts 'Creating database...'
    Rake::Task['db:create'].invoke
    puts 'Migrating database...'
    Rake::Task['db:migrate'].invoke
    puts 'Seeding database...'
    Rake::Task['db:seed'].invoke
    puts 'Database rebuilt successfully!'
  end
end
