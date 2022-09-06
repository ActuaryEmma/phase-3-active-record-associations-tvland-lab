class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name
   "#{self.first_name} #{self.last_name}"
  end

  def list_roles
    names = []
    self.characters.each do |char|
        self.shows.each do |show|
            names << "#{char.name} - #{show.name}"
        end
    end
    names
  end


end