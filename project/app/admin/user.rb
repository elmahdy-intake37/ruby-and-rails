ActiveAdmin.register User do
 permit_params :email, :name, :dob, :gender, :avatar,:is_instructor

end
