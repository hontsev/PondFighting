class Fight < ApplicationRecord
  belongs_to :user
  belongs_to :match
  has_many :fight_results
  
  def fighters
    str=''
	
	for r in fight_results
	  str+=r.duck.name+' , '
	end
	
	return str
  end
  
end
