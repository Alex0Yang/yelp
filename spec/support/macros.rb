def  set_current_user(user = nil)
  session[:user_id] = user ? user.id : Fabricate(:user).id
end

def clear_session
  session[:user_id] = nil
end

def sign_in(user = nil)
  user ||= Fabricate(:user)
  visit sign_in_path
  fill_in "user[email]", with: user.email
  fill_in "user[password]", with: user.password
  click_button "Sign in"
end
