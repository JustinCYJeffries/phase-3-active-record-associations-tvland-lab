class Actor < ActiveRecord::Base
    has_many :characters
    has_many :shows, through: :characters

    def full_name
        "#{self.first_name} #{self.last_name}"
    end

    def list_roles
        self.characters.map do |character|
            "#{character.name} - #{character.show.name}"
        end
    end

    def self.alphabetical
        self.order(:last_name)
    end

    def self.most_gigs
        self.all.sort do |a, b|
            a.characters.count <=> b.characters.count
        end.last
    end
end