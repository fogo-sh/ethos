require "dotenv"
require "option_parser"

begin
  Dotenv.load
rescue
end

require "./ethos"

{Signal::INT, Signal::TERM}.each &.trap do
  puts "\nbye!"
  exit
end

parser = OptionParser.parse do |parser|
  parser.banner = "Usage: ethos [arguments]"

  parser.on("-r", "--run", "Run Ethos") do
    Ethos.run!
    exit
  end

  parser.on("-h", "--help", "Show this help") do
    puts parser
    exit
  end

  parser.invalid_option do |flag|
    STDERR.puts "ERROR: #{flag} is not a valid option."
    STDERR.puts parser
    exit(1)
  end
end

puts parser
