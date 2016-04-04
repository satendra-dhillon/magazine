class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :ratings, class_name: "Rating", foreign_key: :rater_id
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   def name
    self.first_name + " "+ self.last_name
   end

end
