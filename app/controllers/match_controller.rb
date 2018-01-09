class MatchController < ApplicationController
  before_action :check_user
  protect_from_forgery :except => [:singlefight,:fightover]
  

  def showmatches
	
  end

  def showdetail
  end

  def showreplay
  end

  def singlefight
    @duck1=Duck.find_by(id:params[:id1])
	@duck2=Duck.find_by(id:params[:id2])
	if @duck1.nil? or @duck2.nil?
	  redirect_to duck_search_path
	  return
	end
	@duck1.script=@duck1.script.gsub(/\r\n/,'\\r\\n')
	@duck2.script=@duck2.script.gsub(/\r\n/,'\\r\\n')
	@ducks=Array.new
	@ducks.push(@duck1).push(@duck2)
	
  end
  
  def singlefight_submit
  end

  def multifight
  end

  def loopfight
  end

  def fightover
    jdata=params[:all]
	data=JSON.parse(jdata)
    @user=User.find(session[:user_id])
	if not data.nil? and data.size >= 2
	  @match=Match.new
	  @match.is_end=true
	  @match.user=@user
	  if !@match.save
	    render plain: "cannot save"
	    return
	  end
	  @fight=Fight.new
	  @fight.type = 1
	  @fight.match=@match
	  @fight.user=@user
      @fight.save
	  for d in data
	    
		@duck=Duck.find_by(id:d[0])
		fightresult=FightResult.new
		fightresult.fight=@fight
		fightresult.duck=@duck
		fightresult.live_time=d[1].to_f
		fightresult.hp_left=d[2].to_f
		fightresult.dmg=d[3].to_f
		fightresult.save
	  end
	end
    render plain: "success"
  end
  
  
  
  
  
    private
  
  def check_user
    if session[:user_id].nil?
      redirect_to account_login_path, flash: {danger: '请登录'}
    end
  end
  
end
