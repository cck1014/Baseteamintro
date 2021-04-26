class SessionController < ApplicationController
  def new     # 로그인 폼 페이지로 이동
      @user = User.new
  end

  def login
    
    @user=User.find_by(teamname: params[:teamname])
    if @user && @user.authenticate(params[:password])
    session[:teamname] = @user.teamname
    
    redirect_to root_path
	else
		flash[:alert]="아이디 또는 비번 틀림"
		redirect_to session_login_path
	end
	  
	
end



end
