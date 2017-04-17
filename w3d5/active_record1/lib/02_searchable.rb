require_relative 'db_connection'
require_relative '01_sql_object'
require 'byebug'

module Searchable
  def where(params)
    search_line = params.keys
      .map { |attr| "#{attr} = ?" }.join(" AND ")

    values = DBConnection.execute(<<-SQL, *params.values(&:to_s))
      SELECT
        *
      FROM
        #{self.table_name}
      WHERE
        #{search_line}
    SQL
    values.map {|val| self.new(val)}
  end
end

class SQLObject
  extend Searchable
end
