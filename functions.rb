require 'csv'
require 'pg'
require 'pry'


@conn = PGconn.open(:dbname => 'netflix')


def checklogin (a , b)
	loginName = a
	loginPwd = b

	@conn.exec("SELECT * FROM users WHERE name=#{loginName} AND password=#{loginPwd}"


end
