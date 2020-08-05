# frozen_string_literal: true

require_relative '../db'


module Information
  extend self

  # Retrieves the most recent message from the table.
  def get_all_info(country)
    result =[]
    if country
      country = country.to_i
      query = <<~SQL
        SELECT r.information, e.name, r.reference 
        FROM regulation r INNER JOIN event e ON r.event = e.id
        WHERE r.country = ?
      SQL
      rows = DB.execute(query,country)
      # Creates a hash array of most recent messages
      rows.each do |row|
        result << {
          info: row[0],
          eventname: row[1],
          reference: row[2]
        }
      end
    end
    return result
  end
end
