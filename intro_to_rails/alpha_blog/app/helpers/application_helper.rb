module ApplicationHelper
  def gravitar_for(user)
    image_tag(
      "https://media.licdn.com/dms/image/v2/D4E35AQHDBqO2gIGn6g/profile-framedphoto-shrink_400_400/profile-framedphoto-shrink_400_400/0/1724785442368?e=1727470800&v=beta&t=X7n05LyqTX4Ll8X0Bm_m6k_-WnON3Ysy66dBCiGivkM",
      alt: user.username,
      class: "rounded mx-auto d-block",
      style: "max-width: 400px; width: 100%; height: auto;"
    )
  end


  def current_user
    user_id = session[:user_id]
    @current_user ||= User.find user_id if user_id
  end

  def logged_in?
    !!current_user
  end
end
