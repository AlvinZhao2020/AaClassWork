require 'singleton'
require 'sqlite3' 


class QuestionsDatabase < SQLite3::Database
  include Singleton


  def initialize
    super('questions.db')
    self.type_translation = true  #ask question
    self.results_as_hash = true
  end


end


class User
  attr_accessor :id, :fname, :lname
  # include MY_METHODS

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM users")
    data.map { |datum| User.new(datum) }
  end

  def self.find_by_id(id)
    
    user = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT
      *
    FROM
      users
    WHERE
      id = ?
    SQL
    p user
    return nil if user.length == 0

    User.new(user.first)
  end

  def self.find_by_name(fname,lname)
     user = QuestionsDatabase.instance.execute(<<-SQL , fname , lname)
        SELECT 
          *
        FROM
          users
        WHERE
          fname = ? and lname = ? 
          ;
        SQL
      return nil if user.length == 0

      user.map { |datum| User.new(datum)}
  end

   def initialize(row)
    @id = row['id']
    @fname = row['fname']
    @lname = row['lname']
  end


  def authored_questions
    Questions.find_by_author_id(@id)
  end

  def authored_replies
    Replies.find_by_user_id(@id)
  end

end




class Questions 
attr_accessor :id, :body, :title, :author

  def self.find_by_author_id(author_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL , author_id)
      SELECT 
        *
      FROM
        questions
      WHERE
        author_id = ?
        ;
      SQL

    return nil if questions.length == 0

    questions.map { |datum| Questions.new(datum)}
  end

  def self.all

    data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
    data.map { |datum| Questions.new(datum)}
  end

  def self.find_by_id(id)

    question = QuestionsDatabase.instance.execute(<<-SQL , id)
        select 
          * 
        from 
          questions
        where 
          id = ?
    SQL
    return nil if question.length == 0

    Questions.new(question.first)
  end


  def initialize(row)
    @id = row['id']
    @body = row['body']
    @title = row['title']
    @author_id = row['author_id']
  end


  def author
    User.find_by_id(@author_id)
  end

  def replies
    Replies.find_by_question_id(@id)
  end



end


class Question_Follows 

  attr_accessor :id, :user_id, :question_id

  def initialize(row)
    @id = row['id']
    @question_id = row['question_id']
    @user_id = row['user_id']   
  end

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM question_follows")
    data.map { |datum| Question_Follows.new(datum)}
  end

 def self.find_by_id(id)

    question = QuestionsDatabase.instance.execute(<<-SQL , id)
        select 
          * 
        from 
          question_follows
        where 
          id = ?
    SQL
    return nil if question.length == 0 

    Questions_Follows.new(question.first)
  end

end



class Question_Like 
  attr_accessor :id, :user_id, :question_id, :user_like

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM question_likes")
    data.map { |datum| Question_Like.new(datum)}
  end

  def initialize(row)
    @id = row['id']
    @user_id = row['user_id']
    @question_id = row['question_id']
    @user_like = row['user_like']
  end

  def self.find_by_id(id)

    question_like = QuestionsDatabase.instance.execute(<<-SQL , id)
        select 
          * 
        from 
          question_likes
        where 
          id = ?
    SQL
    return nil if question_like.length == 0 

    Questions_Like.new(question_like.first)
  end


end


class Replies 
  attr_accessor :id, :body, :question_id, :user_id, :parent_reply_id

   def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM replies")
    data.map { |datum| Replies.new(datum) }
  end

  def self.find_by_user_id(user_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL , user_id)
      SELECT 
        * 
      FROM
        replies
      WHERE 
        user_id = ?
  SQL
    return nil if replies.length == 0

    replies.map { |datum| Replies.new(datum)}
  end

  def self.find_by_question_id(question_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL , question_id)
        SELECT 
          * 
        FROM
          replies
        WHERE 
          question_id = ?
    SQL
     return nil if replies.length == 0

    replies.map { |datum| Replies.new(datum)}
  end

  def initialize(row)
    @id = row['id']
    @body = row['body']
    @user_id = row['user_id']
    @question_id = row['question_id']
    @parent_reply_id = row['parent_reply_id']
  end

  def self.find_by_id(id)
    reply = QuestionsDatabase.instance.execute(<<-SQL , id)
        SELECT 
          * 
        FROM
          replies
        WHERE 
          id = ?
    SQL
    return nil if reply.length == 0
    p reply.first
    Replies.new(reply.first)
  end

  def author
    User.find_by_id(@user_id)
  end

  def questions
    Questions.find_by_id(@question_id)
  end

  def parent_reply
      Replies.find_by_id(@parent_reply_id)
  end

  def child_reply
    replies = QuestionsDatabase.instance.execute(<<-SQL , @id)
        SELECT 
          *
        FROM
          replies
        WHERE 
          parent_reply_id  = ?
    SQL
    return nil if replies.length == 0
    replies.map{|reply|Replies.new(reply)}
  end

end

