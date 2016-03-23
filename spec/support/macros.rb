def  set_current_user(user = nil)
  session[:user_id] = user ? user.id : Fabricate(:user).id
end

def clear_session
  session[:user_id] = nil
end
