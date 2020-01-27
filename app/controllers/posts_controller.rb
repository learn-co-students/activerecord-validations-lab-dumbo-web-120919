class PostsController < ApplicationController

     def index
        @posts = post.all
    end

    def show
        @post = post.find(params[:id])
    end

    def new
        @post = post.new
    end

    def create
        movie = post.create(post_params)
        redirect_to post_path(post.id)
    end

    def edit
        @post = post.find(params[:id])
    end

    def update
        post = post.find(params[:id])
        post.update(post_params)

        redirect_to post_path(post.id)
    end
    
    def post_params
        params.require(:post).permit(:title, :content, :summary, :category)
    end 
   
end