require "./ethos/db"
require "./ethos/api"
require "./ethos/model"

module Ethos
  VERSION = "0.1.0"

  def self.run!
    puts "running ethos"
    Ethos::DB.setup
    ART.run
  end
end
