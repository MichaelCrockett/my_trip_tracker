require_relative('../db/sql_runner')

class Sight

  attr_accessor :name, :city_id, :country_id
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    @city_id = options['city_id']
    @country_id = options['country_id']
  end

  def save()
    sql = "INSERT INTO sights
    (
    name,
    city_id,
    country_id
    ) VALUES
    (
    $1, $2, $3
    )
    RETURNING id"
    values = [@name, @city_id, @country_id]
    @id = SqlRunner.run( sql, values )[0]["id"].to_i()
  end

  def self.delete_all()
    sql = "DELETE FROM sights"
    SqlRunner.run(sql)
  end

end
