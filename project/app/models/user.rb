class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #realtion
  has_many :courses
  has_many :lectures, through: :courses
  has_many :comments
  has_and_belongs_to_many :lectures
  # belongs_to :role

  #validation
  validates :name , :presence => true , length: { minimum: 5 , maximum: 17}
  validates :gender , :presence => true
  validates :dob , :presence => true
  # before_save :assign_role

  #like or spam
  acts_as_voter

  #to ste rules
  # def instructor?
  #   self.role.name == "instructor"
  # end
  # def student?
  #   self.role.name == "student"
  # end
  # def admin?
  #   self.role.name == "Admin"
  # end
  #
  # def assign_role
  #   self.role = Role.find_by name: "Regular" if self.role.nil?
  # end
  # check role
 #  ROLES = {0 => :guest, 1 => :user, 2 => :instructor, 3 => :admin}
 #
 # attr_reader :role
 #
 # def initialize(role_id = 0)
 #   @role = ROLES.has_key?(role_id.to_i) ? ROLES[role_id.to_i] : ROLES[0]
 # end
 #
 # def role?(role_name)
 #   role == role_name
 # end
 #################for images
 # enum instructor: [:instructor ,:student]
 attr_accessible :avatar , :name , :email, :password, :gender, :dob, :role

 validates :role, :presence => true

 mount_uploader :avatar, AvatarUploader
 # validates_processing_of :image
 # # validate :image_size_validation
 # has_attached_file :image

# private
#   def image_size_validation
#     errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
#   end


#####################################
end
