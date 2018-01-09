class AccountController < ApplicationController
  before_action :check_user, only: [:logout,:info,:info_submit,:info_edit,:changepw_submit,:changepw]


  def regist_new
    @user=User.new
	render 'account/regist'
  end
  
  def regist_submit
      @user = User.new()
	  @user.name=params[:uid]
	  @user.nickname=@user.name
	  @user.email=params[:uemail]
	  @user.avatar="/images/avatar_default.jpg"
	  pw1=params[:upw1]
	  pw2=params[:upw2]
	  if pw1!=pw2 
		redirect_to account_regist_path, flash:{danger:"密码不一致"}
		return
	  end
	  @user.password=pw1
    if @user.save
      redirect_to account_login_path, flash: {success: "新账号注册成功,请登录"}
    else
	  redirect_to account_regist_path, flash: {danger: "账号信息填写有误,请重试"}
    end
  end

  def login_new
	render "account/login"
  end
  
  def login_submit
	user = User.find_by(name: params[:uid].downcase)
    if user && user.authenticate(params[:upw])
      session[:user_id] = user.id
	  session[:user_name] = user.nickname
      # params[:session][:remember_me] == '1' ? remember_user(user) : forget_user(user)
      flash= {:info => "欢迎回来: #{user.nickname} )"}
	  redirect_to root_url, :flash => flash
    else
      flash= {:danger => '账号或密码错误'}
	  redirect_to account_login_path, :flash => flash
    end
    
  end

  def logout
	session[:user_id] = nil
	redirect_to account_login_path,flash:{success:"您已退出登录。"}
  end
  
  def info
    if params[:id].nil?
      id=session[:user_id]
    else 
      id=	params[:id]
	end
	@user=User.find_by(id: id)
	if @user.nil?
	  redirect_to account_info_path
	else 
	  @logs=@user.user_logs.order(updated_at: :desc)
	  @ducknum=@user.duck_number
	  @winrate=@user.win_rate
	  @fightnum=@user.fight_number
	end
  end
  
  
  def info_edit
    @user=User.find(session[:user_id])
  end
  
  def info_submit
    @user=User.find(session[:user_id])
	@user.nickname=params[:unickname]
	@user.introduce=params[:uintroduce]
	@user.email=params[:uemail]
    if @user.save
      redirect_to account_editinfo_path, flash: {danger: "修改完成"}
    else
	  redirect_to account_editinfo_path, flash: {danger: "新信息有误,请重试"}
	end
  end
  
  def changepw
    
  end
  
  def changepw_submit
    @user=User.find(session[:user_id])
    oldpw=params[:oldpw]
	newpw1=params[:newpw1]
	newpw2=params[:newpw2]
	  if not @user.authenticate(oldpw)
		redirect_to account_changepw_path, flash:{danger:"旧密码有误"}
		return
	  end
	  if not newpw1==newpw2
		redirect_to account_changepw_path, flash:{danger:"新密码两次输入不一致"}
		return
	  end
	@user.password=newpw1
	if @user.save
	  session[:user_id]=nil
      redirect_to account_login_path, flash: {danger: "密码修改成功。请重新登录"}
    else
	  redirect_to account_changepw_path, flash: {danger: "新密码不合法"}
	end
  end
  
  
  
  
  
  
  private
  
  def check_user
    if session[:user_id].nil?
      redirect_to account_login_path, flash: {danger: '请登录'}
    end
  end
  
  def current_user
    if session[:user_id]
      @current_user||= User.find_by(id: session[:user_id])
    end
  end
  
  def current_user?(user)
    user == current_user
  end
  

  

  
  
end
