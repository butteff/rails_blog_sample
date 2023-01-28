class CleanupCommentsJob < ApplicationJob
  queue_as :urgent

  def perform(*args)
    # Do something later
    p 'test'
    @comments = Comment.all 
    for comment in @comments
      comment.destroy
    end
  end
end
