require_relative('../db/sql_runner')
require_relative('./sights')
require('pry')

class BucketList

  attr_reader :id
  attr_accessor :sight_id, :visited

def initialize(options)
  @id = options['id'].to_i if options['id']
  @sight_id = options['sight_id'].to_i
  @visited = options['visited']
end



  def save()
    sql = "INSERT INTO bucket_lists
      (
      sight_id, visited
      )
      VALUES
      (
        $1, $2)
        RETURNING id"
    values = [@sight_id, @visited]
    bucket_list = SqlRunner.run(sql, values).first
    @id = bucket_list['id'].to_i
  end


def self.delete_all()
  sql = "DELETE FROM bucket_lists"
  SqlRunner.run(sql)
end

  def self.map_items(bucketlist_data)
    return bucketlist_data.map { |bucketlist| BucketList.new(bucketlist) }
  end


 def self.all()
    sql = "SELECT * FROM bucket_lists"
    list_data = SqlRunner.run(sql)
    sights = self.map_items(list_data)
    return sights
  end

  def sight
    sql = "SELECT * from sights
    WHERE id = $1"
    values = [@sight_id]
    sights_data = SqlRunner.run(sql, values)
    return Sight.new(sights_data[0])
  end

end #class end
