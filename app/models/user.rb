class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

   has_many :gigs

   def requires_confirmation?
     if confirmed?
       false
     else
       true
     end
   end
end
