require 'json'
require 'open-uri'

puts 'Cleaning database...'
Pokemon.destroy_all

puts 'Creating pokemons...'
response = URI.open('https://pokeapi.co/api/v2/pokemon?limit=50').read
results = JSON.parse(response)['results']
results.each do |result|
  info = JSON.parse(URI.open(result['url']).read)
  pokemon = Pokemon.create(name: info['name'].capitalize, element_type: info['types'].first['type']['name'])
  pokemon.photo.attach(io: URI.open(info['sprites']['front_default']), filename: "#{info['name']}.png", content_type: 'image/png')
  puts "Screeahhhhh! #{pokemon.name} created!"
end

puts "Finished! Created #{Pokemon.count} pokemons."