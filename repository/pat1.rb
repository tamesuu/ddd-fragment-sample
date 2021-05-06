class User
  attr_reader :id, :name

  def initialize(id, name)
    @id = id
    @name = name
  end
end

# 抽象化して、データストレージを差し替えられるようにする
# MySQL
# Redis
# Memd
class UserRepository
  attr_reader :users

  def initialize()
    @users = []
  end

  def add(user)
    users.push(user)
  end
end

repo = UserRepository.new
u = User.new(1, 'hoge1')
repo.add(u)
u = User.new(2, 'hoge2')
repo.add(u)
u = User.new(3, 'hoge3')
repo.add(u)
u = User.new(4, 'hoge4')
repo.add(u)

p repo.users
