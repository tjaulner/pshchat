class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :authentication_keys => {username: true, login: false}
         has_many :posts
  #after_validation :createUsername
  #validates :email, presence: true
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  

  #for profile image
  has_one_attached :profile_image

  #bug review
  #attr_writer :login

  def login
   @login || self.username || self.email
  end

  #def self.find_for_database_authentication(warden_conditions)
    #conditions = warden_conditions.dup
    #if (login = conditions.delete(:login))
      #where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    #elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      #where(conditions.to_hash).first
    #end
  #end
  
end
