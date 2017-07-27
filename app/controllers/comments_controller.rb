class CommentsController < ApplicationController
    before_action :find_game
    before_action :find_comment, only: [:edit, :update, :destroy]
    before_action :authenticate_user!

    def create
        @comment = @game.comments.create(comment_params)
        @comment.user_id = current_user.id

        if @comment.save
            @sum = @game.rating
            
            for comment in @game.comments
                puts "Comment rating: #{comment.rating}"
                @sum += comment.rating
            end

            @average_rating = @sum / (@game.comments.count + 1)
            @game.rating = @average_rating
            @game.save
            puts "Current game object: #{@game.rating}"
            
            redirect_to game_path(@game)
        else
            render 'new'
        end

    end

    def edit # possible that this may stay blank?
        @comment = @game.comments.find(params[:id])
    end

    def update
        if @comment.update(comment_params)
            @sum = @game.rating
            
            for comment in @game.comments
                puts "Comment rating: #{comment.rating}"
                @sum += comment.rating
            end

            @average_rating = @sum / (@game.comments.count + 1)
            @game.rating = @average_rating
            @game.save
            puts "Current game object: #{@game.rating}"
             
            redirect_to game_path(@game)
        else
            render 'edit'
        end

    end

    def destroy
        @comment.destroy

        if @comment.destroy
            @sum = @game.rating
            
            for comment in @game.comments
                puts "Comment rating: #{comment.rating}"
                @sum += comment.rating
            end

            @average_rating = @sum / (@game.comments.count + 1)
            @game.rating = @average_rating
            @game.save
            puts "Current game object: #{@game.rating}"

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

end
