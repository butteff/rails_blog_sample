class NewArticleJob < ApplicationJob
  queue_as :default

  def perform(current_user_id)
    # Do something later
    puts 'another job with resque provider wow!'
    @article = Article.create( title: 'Queue new article from active job', body: 'Yep, it works as expected, really', status: 'public', user_id: current_user_id)
    puts current_user_id
    @article.save
  end
end
