require_relative('../db/sql_runner')

class Sight

  attr_accessor :name, :city_id
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    @city_id = options['city_id']
  end

  def save()
    sql = "INSERT INTO sights
    (
    name,
    artist_id,
    genre
    ) VALUES
    (
    $1, $2, $3
    )
    RETURNING id"
    values = [@name, @city_id,]
    @id = SqlRunner.run( sql, values )[0]["id"].to_i()
  end


end
