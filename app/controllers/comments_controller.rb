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
  
        if @comment.save
            redirect_to root_path
        else 
            puts @comment.errors.full_messages
        end
    end
  
    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy

        redirect_to @post
    end

    def reply
        @post = Post.find(params[:post_id])
        parent_comment = Comment.find(params[:id])
        @comment = @post.comments.build(comment_params)
        @comment.author = current_user
        @comment.parent_comment = parent_comment
        parent_comment.replies.push(@comment)

        @comment.save
        redirect_to root_path
    end
  
      private

    def comment_params
        params.require(:comment).permit(:body, :post_id, :parent_comment_id)
    end
  end