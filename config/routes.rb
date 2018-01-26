Rails.application.routes.draw do
  root 'duck#search'
	
  get 'match/showmatches'

  get 'match/showdetail'
  get 'match/showdetail/:id' => 'match#showdetail'

  get 'match/showreplay'

  post 'match/pondmatch' => 'match#singlefight'
  
  post 'match/fightover'

  get 'match/multifight'

  get 'match/loopfight'

  get 'duck/myscript'

  get 'duck/pondtest' => 'duck#createscript'
  
  get 'duck/editscript'
  
  get 'duck/editscript/:id' => 'duck#editscript'
  
  post 'duck/savescript'
  
  get 'duck/deletescript'
  get 'duck/deletescript/:id' => 'duck#deletescript'

  get 'duck/search'
  
  post 'duck/search' => 'duck#search_submit'

  get 'account/regist' => 'account#regist_new'
  
  post 'account/regist' => 'account#regist_submit'

  get 'account/login' => 'account#login_new'
  
  post 'account/login' => 'account#login_submit'

  get 'account/logout' 
  
  get 'account/info'
  get 'account/info/:id' => 'account#info'
  
  get 'account/changepw'
  post 'account/changepw' => 'account#changepw_submit'
  
  get 'account/editinfo' => 'account#info_edit'
  
  post 'account/editinfo' => 'account#info_submit'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
