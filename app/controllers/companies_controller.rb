class CompaniesController < ApplicationController

    def new
        @company = Company.new
        # binding.pry
        # @company.offices.build
        # @company.buildings.build
        render "new"
    end

    def create
        # We want { 'building_id' => [floor1, floor2, ...]}
        # Iterate over keys as building_id
        #   then iterate over value as floors
        #   and create office for each
        # company_params[:offices_attributes].each do |key,vaule|

        #         office[:building_id] = valu[:id]
        #         office[:floor] = 
        binding.pry
    end

    private
    def company_params
        params.require(:company).permit(:name, { offices_attributes: [ :id, offices:[] ] } )
    end
end