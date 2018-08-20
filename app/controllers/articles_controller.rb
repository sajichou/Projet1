class ArticlesController < ApplicationController

	#before_action :admin_validated, only: [:create, :new, :destroy, :edit]

	def create
	end

	def new
		Article.create titre:params[:titre], contenu:params[:contenu],image:params[:image]
		redirect_to "/articles/index"
	end

	def show
		@article= Article.find(params[:id])
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		Article.find(params[:id]).update(
			titre:params[:titre], 
			accroche:params[:accroche],
			date:params[:date],
			contenu:params[:contenu])
		if params[:image].present?
			Article.find(params[:id]).update(image:params[:image])
		end
		redirect_to "/articles/index"
	end

	def destroy
		Article.find(params[:id]).destroy
		redirect_to "/articles/index"
	end

	def index
		@articles = Article.page(params[:page]).per(20)
	end

end
