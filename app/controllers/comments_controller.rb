class CommentsController < ApplicationController
    before_action :find_game
    before_action :find_comment, only: [:edit, :update, :destroy]
    before_action :authenticate_user!

    def create
        @comment = @game.comments.create(comment_params)
        @comment.user_id = current_user.id

        if @comment.save
            get_average
            @game.rating = @average_rating
            @game.save
            
            redirect_to game_path(@game)
        else
            redirect_to game_path(@game)
        end

    end

    def edit # possible that this may stay blank?
        @comment = @game.comments.find(params[:id])
    end

    def update
        if @comment.update(comment_params)
            get_average
            @game.rating = @average_rating
            @game.save
             
            redirect_to game_path(@game)
        else
            render 'edit'
        end

    end

    def destroy
        if @comment.destroy
            get_average
            @game.rating = @average_rating
            @game.save

        end

        redirect_to game_path(@game)
    end

    private

    def comment_params
        params.require(:comment).permit(:rating, :content)
    end
    
    def find_game
        @game = Game.find(params[:game_id])
    end

    def find_comment
        @comment = @game.comments.find(params[:id])
    end

    def get_average
        @sum = 0
        for comment in @game.comments
            @sum += comment.rating
        end

        if @game.comments.count > 1
            @average_rating = @sum / (@game.comments.count)
        else
            @average_rating = @sum
        end
        
    end

end
