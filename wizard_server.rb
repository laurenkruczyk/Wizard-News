
require 'sinatra'
require 'pry'
require 'shotgun'
require 'csv'
require_relative 'wizard_article_class'


get '/' do
  @articles = []
  CSV.foreach("wizard_articles.csv") do |row|
    #create article from file contents
    @articles << WizardArticle.new(row[0], row[1], row[2])
  end
  
  erb :wizard_homepage
end

get '/:url' do
 @article = WizardArticle.new(params[:title], params[:url], params[:description]).select_article("wizard_articles.csv", params[:url])
 # binding.pry
@articles = []
  CSV.foreach("wizard_articles.csv") do |row|
    #create article from file contents
    @articles << WizardArticle.new(row[0], row[1], row[2])
  end


  erb :wizard_article
end

post '/create-article' do
  #create a wizard based on form values
  @article = WizardArticle.new(params[:title], params[:url], params[:description])
  @article.write_to_csv("wizard_articles.csv")
  
  redirect '/'
end

