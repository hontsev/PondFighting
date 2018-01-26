class MatchController < ApplicationController
  before_action :check_user
  protect_from_forgery :except => [:singlefight,:fightover]
  

  def showmatches
	@matches=Match.where(is_end: true).order(updated_at: :desc)
  end

  def showdetail
    @user=User.find(session[:user_id])
	@fight=Fight.find_by(id: params[:id])
	if @fight.nil?
	  redirect_to match_showmatches_path
	else
	  @match=@fight.match
	  
	end
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
    user=User.find(session[:user_id])
	if not data.nil? and data.size >= 2
	  match=Match.new
	  match.is_end=true
	  match.user=user
	  if !match.save
	    render plain: "cannot save"
	    return
	  end
	  fight=Fight.new
	  fight.tag = 1
	  fight.match=match
	  fight.user=user
      fight.save

	  str=''
	  
	  if data.size==2
	    # 1v1
		  duck1=Duck.find_by(id: data[0][0])
		  duck2=Duck.find_by(id: data[1][0])
		  
		  result1=FightResult.new
		  result1.fight=fight
		  result1.duck=duck1
		  result1.live_time=data[0][1].to_f
		  result1.hp_left=data[0][2].to_f
		  result1.dmg=data[0][3].to_f
		  result1.save
		  
		  result2=FightResult.new
		  result2.fight=fight
		  result2.duck=duck2
		  result2.live_time=data[1][1].to_f
		  result2.hp_left=data[1][2].to_f
		  result2.dmg=data[1][3].to_f
		  result2.save
		  
		  win=false
		  draw=false
		  if result1.hp_left == result2.hp_left
		    draw=true
			win=false
		  elsif result1.hp_left>result2.hp_left
		    win=true
			draw=false
		  else 
		    win=false
			draw=false
		  end
		  
		  # 修改duck的自己的战绩记录
		  if draw
		    duck1.draw_count+=1
			duck2.draw_count+=1
		  elsif win
		    duck1.win_count+=1
			duck2.lose_count+=1
		  else
		    duck1.lose_count+=1
			duck2.win_count+=1
		  end
		  duck1.record_timestamps=false
		  duck2.record_timestamps=false
		  duck1.save
		  duck2.save

			# 挑战者
			str="用"+duck1.name+"挑战了"+duck2.user.nickname+"的"+duck2.name+"，"
			if draw
			  str=str+"两人菜鸡互啄，打成了平手。"
			elsif win
			  str=str+"并击败了对方。"
			else
			  str=str+"结果被对方击败了。"
			end
			log=UserLog.new
			log.user=duck1.user
			log.message=str
			log.fight=fight
			log.save

			# 被挑战者
			str=duck1.user.nickname+"用他的"+duck1.name+"向"+duck2.name+"发起了挑战，"
			if draw
			  str=str+"结果两人菜鸡互啄，打成了平手。"
			elsif win
			  str=str+"并成功打败了"+duck2.name+"。"
			else
			  str=str+"结果被"+duck2.name+"击败了。"
			end
		    log=UserLog.new
			log.user=duck2.user
			log.message=str
			log.fight=fight
			log.save
	  else
	    # 1vN
		  for d in data
			duck=Duck.find_by(id:d[0])
			fightresult=FightResult.new
			fightresult.fight=fight
			fightresult.duck=duck
			fightresult.live_time=d[1].to_f
			fightresult.hp_left=d[2].to_f
			fightresult.dmg=d[3].to_f
			fightresult.save
			
			str=duck.user.nickname+"参加了一场"+data.size+"人混战，"
			if d[2].to_f <= 0
			  str=str+"结果没能活到最后。"
			else
			  str=str+"结果以"+d[2].to_f+"点生命值站到了最后。恭喜！"
			end
		    log=UserLog.new
			log.user=duck.user
			log.message=str
			log.fight=fight
			log.save
		  end
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
