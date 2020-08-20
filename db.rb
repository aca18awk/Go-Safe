# frozen_string_literal: true

#require 'sqlite3'

# Database safety module
# Acts an interface been the app and an instance of SQLite3::Database
module DB
  extend self

  private

  def initialise_new_db
    SQLite3::Database.new 'app.sqlite'
  end

  def safety_wrapper
    # Beginning of error handling clause
    begin
      # Initialises new SQLite3::Database
      db = initialise_new_db

      result = yield db if block_given?
    rescue SQLite3::Exception => e # If a DB exception is raised
      # Outputs the error to the console
      puts "Database exception has been raised"
      puts e
    ensure # Regardless of whether an error has occured or not
      db.close if db # Close the database if it has been opened
    end

    return result
  end

  public

  def execute(query, *args)
    safety_wrapper do |db|
      result = db.execute(query, *args)
      if query.split(' ')[0].upcase == 'INSERT'
        result = db.execute('SELECT last_insert_rowid()');
      end

      return result
    end
  end
end
