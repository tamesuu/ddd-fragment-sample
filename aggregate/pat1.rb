class Club
  attr_reader :club_id, :name, :status, :student_ids

  def initialize(name)
    @club_id = 1 # 本来は生成
    @name = name
    @status = 0 # 未承認状態
    @student_ids = []
  end

  def addStudent(student_id)
    # TODO:
    # 登録済みかどうかのチェック
    @student_ids.push(student_id)
  end

  def approve()
    # TODO:
    # 人数が最低人数いるかのチェック
    p '人数が最低人数いるかのチェック'
    @status = 1 # 承認済み
  end
end

class ClubRepository
  def findById(club_id)
    return Club.new('club 1111')
  end
  def save(club)
    # 永続化
    # something to save
    p 'saved ', club.name
  end
end

class Student
  attr_reader :id, :name

  def initialize(id, name)
    @id = id
    @name = name
  end
end

class StudentRepository
  def findById(student_id)
    return Student.new(student_id, 'hoge')
  end

  def save(student)
    # 永続化
    # something to save
  end
end

class ClubApplicationService
  attr_reader :club_repository

  def initialize(club_repository)
    @club_repository = club_repository
  end

  def addStudent(club_id, student_id)
    club = @club_repository.findById(club_id)
    club.addStudent(student_id)
    @club_repository.save(club)
  end

  def approveClub(club_id)
    club = @club_repository.findById(club_id)
    club.approve()
    @club_repository.save(club)
    p 'approved'
  end
end


a = ClubApplicationService.new(ClubRepository.new)
a.addStudent(1, 100)
a.addStudent(2, 101)
a.addStudent(3, 105)
a.approveClub(1)
