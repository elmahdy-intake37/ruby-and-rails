  ActiveAdmin.register Comment, :as => "LectureComment" do
permit_params :body, :commenter, :user_id, :Lecture_id



end
