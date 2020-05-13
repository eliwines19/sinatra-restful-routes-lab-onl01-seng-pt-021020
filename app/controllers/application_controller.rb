class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    "Vegan Breakfast Recipes"
  end

  #Index Action
  get '/recipes' do
    @recipe = Recipe.all
    erb :index
  end

  #New Action
  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    @recipe = Recipe.create(:name = params[:name], :recipe = params[:recipe], :cook_time = params[:cook_time])
    redirect to "/recipes/#{@recipe.id}"
  end

  #Show Action
  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  #Edit Action
  get '/recipes/:id/edit' do
    @recipe2 = Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    @recipe2 = Article.find_by_id(params[:id])
    @recipe2.name = params[:name]
    @recipe2.ingredients = params[:ingredients]
    @recipe2.cook_time = params[:cook_time]
    @recipe2.save
    redirect to "/articles/#{@article.id}"
  end

  #Delete Action
  delete '/recipes/:id' do
    @reecipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to "/recipes"
  end

end
