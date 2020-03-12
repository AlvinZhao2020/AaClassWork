

module MY_METHODS
  p self
  def self.find_by_id(id, table1)
     QuestionsDatabase.instance.execute(<<-SQL, id, table1)
      SELECT
        *
      FROM
        table1 
      WHERE
        id = ?
    SQL
  end

end
