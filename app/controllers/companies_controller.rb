class CompaniesController < ApplicationController

    def new
        @company = Company.new
        # binding.pry
        # @company.offices.build
        # @company.buildings.build
        render "new"
    end
    def show
        @company = Company.find(params[:id])
        render "show"
    end
    def create
        # We want { 'building_id' => [floor1, floor2, ...]}
        # Iterate over keys as building_id
        #   then iterate over value as floors
        #   and create office for each
        @company = Company.create(name: company_params[:name]) 
        company_params[:offices_attributes].each do |_, value| 
            building = Building.find(value["id"])
            if value.has_key?("offices")
                value["offices"].each do |floor|
                    office = Office.new(floor: floor)
                    office.building = building
                    office.company = @company
                    office.save
                end
            end

        end
        redirect_to company_path(@company)
    end

    private
    def company_params
        params.require(:company).permit(:name, { offices_attributes: [ :id, offices:[] ] } )
    end
end