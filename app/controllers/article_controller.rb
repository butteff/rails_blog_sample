class ArticleController < ApplicationController
  include ApplicationHelper
  include ActionView::Helpers::SanitizeHelper
  require 'redis'
  
  #basic oauth Let's implement it too
  #http_basic_authenticate_with name: "lol", password: "test", except: [:index, :show]
  before_action :require_login, except: [:show, :index]

  def index
    redis = Redis.new()
    redis.set('test', '<script>alert(\'hello\')</script><h1>Redis value with sanitized tags</h1>') 
    @test = strip_tags(redis.get('test'))
    @articles = Article.all
    @authors = []

    for user in User.all 
      @authors[user.id] = user.email.gsub(/@.*/, '')
    end
  end

  def cleanup
    job = CleanupCommentsJob.perform_now(true)
    redirect_to root_path
  end

  def sendmail
    TestMailer.with(message: 'hello').test_email.deliver_now
  end

  def autoadd
    job = NewArticleJob.perform_later(current_user.id)
    redirect_to root_path
  end

  def show
    @article = Article.find(params['id'])
    if (@article.status == 'private' && !current_user) || (@article.status == 'private' && @article.user_id != current_user.id)
      redirect_to root_path
    end
  end

  def new
    @article = Article.new
  end

  def create
    params = article_params
    params[:user_id] = current_user.id 
    @article = Article.new(params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    params = article_params
    params[:user_id] = @article.user_id
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to root_path
  end

  def flash
    #flash[:notice] = "Post successfully created"
    redirect_to root_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :status)
    end

  private
    def require_login
      if current_user.nil?
        #flash[:error] = "You must be logged in to access this section"
        redirect_to new_user_session_path # halts request cycle
      end
    end
end