#execute with "rails spec" from terminal
#expectation mathces info is here: https://relishapp.com/rspec/rspec-expectations/v/3-12/docs/built-in-matchers

require 'rails_helper'
RSpec.describe Article, type: :model do 
    context "some test" do 
      it '(hey test overview)' do
        article = Article.new
        article.title = 'hey'
        article.body = 'some text here'
        article.user_id = 1
        article.save

        expect(article.title).to eq('hey')
      end
    end
end