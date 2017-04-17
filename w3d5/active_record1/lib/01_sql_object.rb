require_relative 'db_connection'
require 'active_support/inflector'
require 'byebug'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject

  def self.columns
    return @columns if @columns
    cols = DBConnection.execute2(<<-SQL).first
        SELECT
          *
        FROM
          #{self.table_name}
        SQL

    @columns = cols.map(&:to_sym)
  end

  def self.finalize!
    self.columns.each do |name|

      define_method(name) do
        self.attributes[name]
      end

      define_method("#{name}=") do |value|
        self.attributes[name] = value
      end

    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name || self.name.underscore.pluralize #return it if it exists.
  end

  def self.all
    db_return = DBConnection.execute(<<-SQL)
                  SELECT
                    #{self.table_name}.*
                  FROM
                    #{self.table_name}
                  SQL
    parse_all(db_return)
  end

  def self.parse_all(results)
    results.map {|result| self.new(result) }
  end

  def self.find(id)
    db_return = DBConnection.execute(<<-SQL, id)
                  SELECT
                    #{self.table_name}.*
                  FROM
                    #{self.table_name}
                  WHERE
                    id = ?
                  SQL
    parse_all(db_return).pop
  end

  def initialize(params = {})
    params.each do |attr_name,val|
      attr_name = attr_name.to_sym
      if self.class.columns.include?(attr_name)
        send("#{attr_name}=", val)
      else
        raise("unknown attribute '#{attr_name}'")
      end
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    @attributes.values
  end

  def insert
    cols = self.class.columns.drop(1) #don't grab the id
    col_names = cols.map(&:to_s).join(",")
    question_marks = (["?"] * cols.length).join(", ")
    values = self.attribute_values
    DBConnection.execute(<<-SQL, *values)
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{question_marks})
      SQL
    self.id = DBConnection.last_insert_row_id
  end

  def update
    set_line = attributes.keys.drop(1)
      .map { |attr| "#{attr} = ?" }.join(", ")

    DBConnection.execute(<<-SQL, *attribute_values.drop(1), id)

      UPDATE
        #{self.class.table_name}
      SET
        #{set_line}
      WHERE
        #{self.class.table_name}.id = ?
      SQL
  end

  def save
    id.nil? ? insert : update
  end
end
