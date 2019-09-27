require_relative('../db/sql_runner')

class Country

  attr_accessor :name, :city_id
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
  end
