class User < ApplicationRecord

  before_save :downcase_email
  validates :name, presence: { message: "用户名不能为空" } , length: {maximum: 50}
  validates :password, presence: { message: "密码不能为空" }  , length: {minimum: 6}, allow_nil: true
  validates_uniqueness_of :name, message:"用户名已存在"
  
  has_many :ducks
  has_many :user_logs
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: { message: "邮箱不能为空" }  , length: {maximum: 255},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false}
  
  validates :nickname, presence: true,length: {maximum: 50}
  validates :introduce , presence: false,length: {maximum: 500}, allow_nil: true
  


  # Returns true if the given token matches the digest.
  def user_authenticated?(attribute, token)
    return password==token
    
  end
  
  def authenticate(pw)
	return pw==self.password
  end
  
  def duck_number
	d=ducks.where('is_public':true, 'is_delete':false).all
	if d.nil?
	  return 0
	else 
	  return d.size
	end
  end
  
  def win_rate
    d=ducks.where('is_public':true, 'is_delete':false).all
	if d.nil?
	  return 0
	else 
	  win=0
	  all=0
	  for duck in d
	    win+=duck.win_count
		all+=duck.win_count
		all+=duck.lose_count
		all+=duck.draw_count
	  end
	  if all <= 0
	    all=1
	  end
	  v=win*100.0/all
	  return '%.2f' % v
	end
  end
  
  def fight_number
    if user_logs.nil?
	  return 0
	else 
	  return user_logs.size
	end
	
  end
  
  def myducks
    d=ducks.where('is_delete':false).order(updated_at: :desc)
  end

  private

  def downcase_email
    self.email = email.downcase
  end


end
