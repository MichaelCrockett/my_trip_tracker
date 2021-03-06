require_relative('../db/sql_runner')
require_relative('./sight')
require_relative('./city')
require_relative('./country')
require('pry')

class Trip

  attr_reader :id
  attr_accessor :sight_id, :visited

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @sight_id = options['sight_id'].to_i
    @visited = options['visited']
  end



  def save()
    sql = "INSERT INTO trips
    (sight_id, visited)
    VALUES
    ($1, $2)
    RETURNING id"
    values = [@sight_id, @visited]
    trip = SqlRunner.run(sql, values).first
    @id = trip['id'].to_i
  end


  def self.delete_all()
    sql = "DELETE FROM trips"
    SqlRunner.run(sql)
  end

  def self.map_items(trip_data)
    return trip_data.map { |trip| Trip.new(trip) }
  end


  def self.all()
    sql = "SELECT * FROM trips
    ORDER BY id"
    list_data = SqlRunner.run(sql)
    trips = self.map_items(list_data)
    return trips
  end

  def sight
    sql = "SELECT * from sights
    WHERE id = $1"
    values = [@sight_id]
    sights_data = SqlRunner.run(sql, values)
    return Sight.new(sights_data[0])
  end

  def delete()
    sql = "DELETE FROM trips
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM trips
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    trip = Trip.new(result)
    return trip
  end


  # a method to toggle city's visited status
  # if the city's attribute is 'visited'
  # then change to 'not visited'
  # but, if the city's attribute is 'not visited'
  # change it to 'visited'
  # then finish






    def toggle_visited
      if @visited == 't'
        @visited = 'f'
      elsif
        @visited = 't'
      end
      sql = "UPDATE trips
      SET visited = $1
      WHERE id = $2"
      values = [@visited, @id]
      SqlRunner.run(sql, values)
    end

  end #class end
