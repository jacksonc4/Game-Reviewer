class ScreenshotsController < ApplicationController
    before_action :find_game
    before_action :find_screenshot, only: [:edit, :update, :destroy]

    def index
        @screenshots = @game.screenshots.all.order("created_at DESC")
    end

    def create
        @screenshot = @game.screenshots.create(screenshot_params)
        if @screenshot.save
            redirect_to game_path(@game)
        else
            redirect_to game_path(@game)
        end

    end

    def destroy
        @screenshot.destroy
        redirect_to game_path(@game)
    end

    private

    def screenshot_params
        params.require(:screenshot).permit(:title, :image)
    end
    
    def find_game
        @game = Game.find(params[:game_id])
    end

    def find_screenshot
        @screenshot = @game.screenshots.find(params[:id])
    end

end
