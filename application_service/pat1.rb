class User
  attr_reader :user_name

  def initialize(user_name)
    # UserName クラスである
    @user_name = user_name
  end

  def save
    # 保存処理
  end
end

class UserName
  attr_reader :value
  def initialize(value)
    # TODO: 名前の制約を書く
    @value = value
  end
end

# 状態を持たないクラス
# Value Object / Entity にあると不自然なメソッドを書く
class UserExistService
  def exists(user)
    # 何かしらの重複チェック
    false
  end
end

class UserApplicationService
  attr_reader :user_service

  def initialize(user_serivce)
    @user_service = user_serivce
  end

  def register(name)
    user = User.new(UserName.new(name))

    # 重複チェック
    user_exist_service = UserExistService.new
    if (user_exist_service.exists(user))
      # 例外出力
    end

    user.save()
    user
  end
end

p UserApplicationService.new(UserExistService.new).register('new_user222!')
