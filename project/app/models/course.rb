class Course < ActiveRecord::Base
  belongs_to :User
  has_many :lectures
  validates :title , :presence => true , length: { minimum: 3 , maximum: 30}
   mount_uploader :image, CoursesUploader
   delegate :name, to: User, prefix: true #-> @order.user_name

end
