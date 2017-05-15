class Lecture < ActiveRecord::Base
  belongs_to :User
  belongs_to :Course
  has_many :comments
  #for like and flag
  has_and_belongs_to_many :users
  acts_as_votable
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
    # validates :name # Make sure the owner's name is present.
    validates :title , :presence => true , length: { minimum: 3 , maximum: 30}
    validates :content , :presence => true
    validates :name , :presence => true
    validates :Course_id , :presence  => true
    mount_uploader :image, ImageLectureUploader

end
