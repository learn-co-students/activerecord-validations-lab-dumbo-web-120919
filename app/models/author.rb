class Author < ActiveRecord::Base
    validates :name, presence: true, uniqueness: true
    validates_length_of :phone_number, is: 10
    #validates :phone_number, length: { is: 10}
    # {:length => {:minimum => 10}}
end
