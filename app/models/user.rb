class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

   acts_as_messageable

   has_many :gigs
   has_many :favorites, dependent: :destroy

   validates :username, presence: :true, uniqueness: { case_sensitive: false }
   validate :validate_username
   validates :email, presence: :true, uniqueness: { case_sensitive: false }

   validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

   def favorite_for(gig)
     favorites.where(gig_id: gig.id).first
   end

   def mail_email(object)
     email
   end

   def validate_username
      if User.where(email: username).exists?
        errors.add(:username, :invalid)
      end
    end

  #  def self.find_for_database_authentication(warden_conditions)
  #     conditions = warden_conditions.dup
  #     if login = conditions.delete(:login)
  #       where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
  #     elsif conditions.has_key?(:username) || conditions.has_key?(:email)
  #       where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
  #     end
   #
  #     conditions[:email].downcase! if conditions[:email]
  #     where(conditions.to_h).first
  #  end

   def requires_confirmation?
     if confirmed?
       false
     else
       true
     end
   end

   def avatar_url(size)
     gravatar_id = Digest::MD5::hexdigest(self.email).downcase
     "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
   end
end
