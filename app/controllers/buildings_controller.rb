class BuildingsController < ApplicationController

    def index
        @buildings = Building.all
        render "index"
    end

    def show
        find_building
        render "show"
    end

    def edit
        find_building
        render "edit"
    end

    def update
        find_building
        #Do some update stuff
    end

    private
    def find_building
        @building = Building.find(params[:id])
    end
end