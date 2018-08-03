module UsersHelper
  def check_admin
    current_user.role == "admin"
      # p "------------------"
      # p User.find_by_id(session[:user_id]).role
  end
  def check_user
     session[:user_id]
      # p "------------------"
      # p User.find_by_id(session[:user_id]).role
  end
end
