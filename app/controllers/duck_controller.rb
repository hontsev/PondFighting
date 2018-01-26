class DuckController < ApplicationController
  before_action :check_user
  protect_from_forgery :except => :savescript  
  
  def myscript
    @user=User.find_by(id:session[:user_id])
	@myducks=@user.myducks.order(updated_at: :desc)
  end

  def createscript
    if flash[:is_edit].nil?
	  session[:script_id]=nil
	end
	if not session[:script_id].nil?
		@duck=Duck.find_by(id:session[:script_id])
		@duck.script=@duck.script.gsub(/\r\n/,'\\r\\n')
	end
  end
  
  def savescript
    if session[:script_id].nil?
      @duck=Duck.new
	  @duck.user_id=session[:user_id]
	else 
	  @duck=Duck.find_by(id:session[:script_id])
	end
	if params[:script_is_block]=='1'
		@duck.is_block=true
	else
	    @duck.is_block=false
	end
	if params[:script_is_public]=='1'
	    @duck.is_public=true
	else
	    @duck.is_public=false
	end
	@duck.is_delete=false
	@duck.win_count=0
	@duck.lose_count=0
	@duck.draw_count=0
	@duck.name=params[:script_name]
	@duck.savescript params[:script_script]
	
	
	if @duck.save
	  render plain: '保存成功'
	  return
	  # redirect_to duck_myscript_path, flash:{info: '保存成功'}
	else 
	  render plain: '保存失败，请检查信息'
	  return
	  # redirect_to duck_myscript_path, flash:{info: '保存失败，请检查信息'}
	end
	
  end

  def editscript
    @duck=Duck.find_by(id:params[:id])
	if @duck.nil?
	  redirect_to duck_myscript_path
	else
	  session[:script_id]=params[:id]
	  redirect_to duck_pondtest_path, flash:{is_edit: true}
	end
  end

  def deletescript
    @duck=Duck.find_by(id:params[:id])
	if @duck.nil?
	  redirect_to duck_myscript_path, flash:{info: '不存在此脚本'}
	else
	  @duck.is_delete=true
	  @duck.save
	  redirect_to duck_myscript_path, flash:{info: '删除成功'}
	end
  end

  def search
    @user=User.find_by(id:session[:user_id])
	@myducks=@user.ducks
	@ducks=Duck.where(is_delete:false,is_public:true).order(updated_at: :desc)
  end
  
    
  private
  
  def check_user
    if session[:user_id].nil?
      redirect_to account_login_path, flash: {danger: '请登录'}
    end
  end
  
  
  
end
