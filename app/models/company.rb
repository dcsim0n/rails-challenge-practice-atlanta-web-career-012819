class Company < ApplicationRecord
    has_many :offices
    has_many :buildings, through: :offices
    has_many :employees
    accepts_nested_attributes_for :offices

    def get_floors
        self.offices.inject({}) do |res, office|
            res[office.building.name] ||= []
            res[office.building.name] << office.floor
            res
        end
    end
end
