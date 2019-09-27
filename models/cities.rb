require_relative('../db/sql_runner')

class City

  attr_accessor :name, :country_id
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    @country_id = options['country_id']
  end
