class Duck < ApplicationRecord

  belongs_to :user
  has_many :fight_results
  has_many :fights, through: :fight_results

  def win_rate
    all_count=win_count+lose_count+draw_count
	if all_count <= 0
	  return 0.00
	else 
	
      v=win_count*100.0/all_count
	  return '%.2f' % v
	end
  end
  
  def savescript(script)
	script.gsub!(/\r/u,'\\r')
	script.gsub!(/\n/u,'\\n')
	self.script=script
  end
  

end
