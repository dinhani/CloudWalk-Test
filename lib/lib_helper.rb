require 'json'

['domain', 'infra', 'view'].each do |folder|
  Dir.glob("lib/#{folder}/*.rb").each do |filename|
    require File.expand_path(filename)
  end
end
