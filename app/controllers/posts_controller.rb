class PostsController < ApplicationController
    def index
        friend_ids = current_user.friends.pluck(:id)
        friend_posts = []
        Post.all.each { |post| friend_posts << post if friend_ids.any? {|id| id == post.author_id} }
        @posts = current_user.posts + friend_posts
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = current_user.posts.build
    end

    def create
        @post = @current_user.posts.new(post_params)

        if @post.save 
            redirect_to posts_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        fetch_post
    end

    def update
        @post = Post.find(params[:id])
        
        if @post.update(post_params)
            redirect_to posts_path
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @post = Post.find(params[:id])

        @post.destroy
        redirect_to posts_path
    end

    private 

    def post_params
        params.require(:post).permit(:body, :title)
    end
end
