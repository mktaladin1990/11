module SessionsHelper
  def log_in user
    session[:user_id] = user.id
  end

  def log_out
    session.delete :user_id
  end
  def check_log
     session[:user_id] != nil
  end
end
