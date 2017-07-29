class GamesController < ApplicationController
    before_action :find_game, only: [:show, :update, :edit, :destroy]

    def index
        @games = Game.all
        if params[:search]
            @games = Game.search(params[:search]).order("created_at DESC")
        else 
            @games = Game.all.order("created_at DESC")
        end

    end

    def show
        find_game
    end

    def new
        @game = Game.new
    end

    def create
        @game = Game.new(game_params)
        if @game.save
            redirect_to root_path
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if @game.update(game_params)
            redirect_to game_path
        else 
            render 'edit'
        end
    end

    def destroy
        @game.destroy
        redirect_to root_path
    end

    private
        def game_params
            params.require(:game).permit(:title, :image, :description, :rating)
        end
        
        def find_game
            @game = Game.find(params[:id])
        end

end
