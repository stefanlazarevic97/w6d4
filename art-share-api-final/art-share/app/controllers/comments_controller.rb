class CommentsController < ApplicationController
    def index
        comments = Comment.comments_for_user_or_artwork_id(params[:user_id], params[:artwork_id])
        render json: comments
    end
    
    def create
        comments = Comment.new(comments_params)
        
        if comment.save
            render json: comment, status: :created
        else
            render json: comment.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        comment = Comment.find_by(id: params[:id])
        comment.destroy
        render json: comment
    end

    private
    
    def comments_params
        params.require(:comment).permit(:body, :commenter_id, :artwork_commented_id_id)
    end
end
