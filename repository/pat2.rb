# 永続化志向
# AR として見る
class User
  attr_reader :id, :name

  def initialize(id, name)
    @id = id
    @name = name
  end

  def save
    # 保存処理
    p 'saved'
    self
  end
end


class UserRepository
  def save(user)
    user.save
  end
end

repo = UserRepository.new
u = User.new(100, 'hoge')
u2 = repo.save(u)
p u2
