class CommentsController < ApplicationController
    before_action :set_comment, only: [:edit, :update, :destroy]
    def edit
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
    end
  
    def update
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        if @comment.update(comment_params)
            redirect_to @post
        else
            render :edit, status: :unprocessable_entity
        end
    end
    
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.build(comment_params)
        @comment.author = current_user
  
        @comment.save
        redirect_to @post
    end
  
    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy

        redirect_to @post
    end
  
      private

    def comment_params
        params.require(:comment).permit(:post_id, :user_id, :body)
    end
  end