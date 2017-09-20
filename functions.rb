require 'csv'
require 'pg'
require 'pry'


@conn = PGconn.open(:dbname => 'netflix')
