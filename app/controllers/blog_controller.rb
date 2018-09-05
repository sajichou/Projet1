class BlogController < ApplicationController

	#before_action :admin_validated, only: [:create, :new, :destroy, :edit]

	def create
	end

	def new
		Blog.create titre:params[:titre], contenu:params[:contenu],image:params[:image]
		redirect_to "/blog/index"
	end

	def show
		@article= Blog.find(params[:id])
	end

	def edit
		@article = Blog.find(params[:id])
	end

	def update
		Blog.find(params[:id]).update(
			titre:params[:titre], 
			accroche:params[:accroche],
			date:params[:date],
			contenu:params[:contenu])
		if params[:image].present?
			Blog.find(params[:id]).update(image:params[:image])
		end
		redirect_to "/blog/index"
	end

	def destroy
		Blog.find(params[:id]).destroy
		redirect_to "/blog/index"
	end

	def index
		@articles = Blog.page(params[:page]).per(20)
	end

end
