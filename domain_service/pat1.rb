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

class Client
  def create_user(user_name)
    user = User.new(UserName.new(user_name))

    # 重複チェック
    user_exist_service = UserExistService.new
    if (user_exist_service.exists(user))
      # 例外出力
    end

    user.save()

    user
  end
end

p Client.new.create_user('new_user!')
