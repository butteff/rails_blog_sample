namespace :mytasks do
    desc "This is a Hello world task. All it does it say hello"
    task :hello => :environment do
      puts "Hello! lol"
    end

    task :ololol => :environment do
      @articles = Article.all 
      for art in @articles
        p art.title + "\n"
      end
    end
end