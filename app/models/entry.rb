class Entry < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :number
  validates_presence_of :first_name,:last_name, :number
  validates_format_of :number, :with => /^\+[0-9]+\s[0-9]+\s[0-9]{6,}$/i, :allow_blank => false, :message => "Should be  a \"+\" followed by a nonempty group of digits, a space, a nonempty group of digits, a space, a group of digits with at least 6 digits (e.g. +39 02 1234567)"

  def self.search(filter)
    if filter
      where('first_name LIKE ? OR last_name LIKE ? OR number LIKE ?', "%#{filter}%","%#{filter}%","%#{filter}%")
    end
  end
end
