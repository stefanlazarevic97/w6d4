class CommentsController < ApplicationController
    def index
        if !params[:user_id].nil?
            user = User.find(params[:user_id])
            comments = user.comments
        elsif !params[:artwork_id].nil?
            artwork = Artwork.find(params[:artwork_id])
            comments = artwork.comments
        else
            comments = Comment.all
        end

        render json: comments
    end
    
    def create
        comment = Comment.new(comments_params)
        
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
        params.require(:comment).permit(:body, :commenter_id, :artwork_commented_id)
    end
end
