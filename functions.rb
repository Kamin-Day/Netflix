# TODO: Organize this into smaller "model" files.
require_relative "models/video.rb"
require_relative "models/login.rb"
require_relative "models/user.rb"


# # A seemingly completely useless function :D!!!!!!!!!!!!!!!!!!!!! lolz!
# #SOOPER DOOPER DOOD
# def loadVideoInfo(video)
# 	conn = PGconn.open(:dbname => 'netflix')
# 	result = conn.exec("SELECT * FROM users WHERE video=#{video};").to_a
# 	return result[0]["video"]

# end

