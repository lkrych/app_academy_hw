json.benches @benches.each do |bench|
  json.description bench.description
  json.lat bench.lat
  json.long bench.lon
end
