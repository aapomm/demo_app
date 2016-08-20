class UserAuthenticator


  def initialize username
    @user = Admin.where(:username => username).first
  end


  def authenticate unencrypted_password
    return false if @user.nil?

    @user.authenticate(unencrypted_password) ? @user : false

  end

end
