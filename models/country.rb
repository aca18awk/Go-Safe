
require 'sqlite3'

module Country
  extend self

  # Retrieves the most recent message from the table.
  def get_all_countries()
    db = SQLite3::Database.new './app.sqlite'
    result =[]
    query = <<~SQL
      SELECT * FROM country
    SQL
    rows = db.execute(query)
    rows.each do |row|
      result << {
        id: row[0],
        country: row[1]
      }
    end
    return result
  end
  
  def get_id(country)
    db = SQLite3::Database.new './app.sqlite'
    query = <<~SQL
      SELECT id FROM country where country = ?
    SQL
    result = db.execute(query, country).first
    return result.first
  end
end
