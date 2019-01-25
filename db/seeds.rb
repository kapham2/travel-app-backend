# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

kim = User.create(username: "kim", password: "password")
kim2 = User.create(username: "kim2", password: "password2")
lili = User.create(username: "lili", password: "password")
sarge = User.create(username: "sarge", password: "password")
tommy = User.create(username: "tommy", password: "password")
milo = User.create(username: "milo", password: "password")
taz = User.create(username: "taz", password: "password")


kimfollowingkim2 = Follow.create(follower_id:kim.id, following_id: kim2.id)
kimfollowinglili = Follow.create(follower_id: kim.id, following_id: lili.id)
lilifollowingkim = Follow.create(follower_id: lili.id, following_id: kim.id)
kimfollowingtaz = Follow.create(follower_id: kim.id, following_id: taz.id)
kimfollowingtommy = Follow.create(follower_id: kim.id, following_id: tommy.id)
kimfollowingmilo = Follow.create(follower_id: kim.id, following_id: milo.id)
sargefollowingkim = Follow.create(follower_id: sarge.id, following_id: kim.id)

positano = Destination.create(city: "Positano", state: "", country: "Italy", continent: "Europe")
florence = Destination.create(city: "Florence", state: "", country: "Italy", continent: "Europe")
athens = Destination.create(city: "Athens", state: "", country: "Greece", continent: "Europe")
kalambaka = Destination.create(city: "Kalambaka", state: "", country: "Greece", continent: "Europe")
santorini = Destination.create(city: "Santorini", state: "", country: "Greece", continent: "Europe")
pamukkale = Destination.create(city: "Pamukkale", state: "", country: "Turkey", continent: "Europe Asia")
cappadocia = Destination.create(city: "Cappadocia", state: "", country: "Turkey", continent: "Europe Asia")
shanghai = Destination.create(city: "Shanghai", state: "", country: "China", continent: "Asia")
danang = Destination.create(city: "Da Nang", state: "", country: "Vietnam", continent: "Asia")
budapest = Destination.create(city: "Budapest", state: "", country: "Hungary", continent: "Europe")
prague = Destination.create(city: "Prague", state: "", country: "Czech Republic", continent: "Europe")
paris = Destination.create(city: "Paris", state: "", country: "France", continent: "Europe")
galapagos = Destination.create(city: "Galapagos Islands", state: "", country: "Ecuador", continent: "South America")
easterisland = Destination.create(city: "Easter Island", state: "", country: "Chile", continent: "South America")
halongbay = Destination.create(city: "Ha Long Bay", state: "", country: "Vietnam", continent: "Asia")
banff = Destination.create(city: "Banff", state: "", country: "Canada", continent: "North America")
bali = Destination.create(city: "Bali", state: "", country: "Indonesia", continent: "Asia")
banos = Destination.create(city: "Banos", state: "", country: "Ecuador", continent: "South America")
dubai = Destination.create(city: "Dubai", state: "", country: "United Arab Emirates", continent: "Asia")
jerusalem = Destination.create(city: "Jerusalem", state: "", country: "Israel", continent: "Asia")
chicago = Destination.create(city: "Chicago", state: "Illinois", country: "USA", continent: "North America")
newyorkcity = Destination.create(city: "New York City", state: "New York", country: "USA", continent: "North America")
lasvegas = Destination.create(city: "Las Vegas", state: "Nevada", country: "USA", continent: "North America")
sanfrancisco = Destination.create(city: "San Francisco", state: "California", country: "USA", continent: "North America")
austin = Destination.create(city: "Austin", state: "Texas", country: "USA", continent: "North America")
machupicchu = Destination.create(city: "Machu Picchu", state: "", country: "Peru", continent: "South America")
barcelona = Destination.create(city: "Barcelona", state: "", country: "Spain", continent: "Europe")
london = Destination.create(city: "London", state: "", country: "England", continent: "Europe")
patagonia = Destination.create(city: "Patagonia", state: "", country: "Argentina", continent: "South America")
maui = Destination.create(city: "Maui", state: "Hawaii", country: "USA", continent: "North America")
riodejaneiro = Destination.create(city: "Rio de Janeiro", state: "", country: "Brazil", continent: "South America")
hongkong = Destination.create(city: "Hong Kong", state: "", country: "China", continent: "Asia")
tokyo = Destination.create(city: "Tokyo", state: "", country: "Japan", continent: "Asia")
boston = Destination.create(city: "Boston", state: "Massachusetts", country: "USA", continent: "North America")
sydney = Destination.create(city: "Sydney", state: "", country: "Australia", continent: "Australia")
cairo = Destination.create(city: "Cairo", state: "", country: "Egypt", continent: "Africa")
toronto = Destination.create(city: "Toronto", state: "", country: "Canada", continent: "North America")
istanbul = Destination.create(city: "Istanbul", state: "", country: "Turkey", continent: "Europe Asia")
seattle = Destination.create(city: "Seattle", state: "Washington", country: "USA", continent: "North America")
houston = Destination.create(city: "Houston", state: "Texas", country: "USA", continent: "North America")
stpetersburg = Destination.create(city: "St Petersburg", state: "", country: "Russia", continent: "Asia")
taipei = Destination.create(city: "Taipei", state: "", country: "Taiwan", continent: "Asia")
manila = Destination.create(city: "Manila", state: "", country: "Philippines", continent: "Asia")
angkor = Destination.create(city: "Angkor", state: "", country: "Cambodia", continent: "Asia")
vientiane = Destination.create(city: "Vientiane", state: "", country: "Laos", continent: "Asia")
phucket = Destination.create(city: "Phuket", state: "", country: "Thailand", continent: "Asia")
yangon = Destination.create(city: "Yangon", state: "", country: "Myanmar", continent: "Asia")
kualalumpur = Destination.create(city: "Kuala Lumpur", state: "", country: "Malaysia", continent: "Asia")
milfordsound = Destination.create(city: "Milford Sound", state: "", country: "New Zealand", continent: "Australia Asia")
parovalley = Destination.create(city: "Paro Valley", state: "", country: "Bhutan", continent: "Asia")
himalayas = Destination.create(city: "Himalayas", state: "", country: "Nepal", continent: "Asia")
agra = Destination.create(city: "Agra", state: "", country: "India", continent: "Asia")
lahore = Destination.create(city: "Lahore", state: "", country: "Pakistan", continent: "Asia")
bamyanvalley = Destination.create(city: "Bamyan Valley", state: "", country: "Afghanistan", continent: "Asia")
astana = Destination.create(city: "Astana", state: "", country: "Kazakhstan", continent: "Asia")
tehran = Destination.create(city: "Tehran", state: "", country: "Iran", continent: "Asia")
muscat = Destination.create(city: "Muscat", state: "", country: "Oman", continent: "Asia")
riyadh = Destination.create(city: "Riyadh", state: "", country: "Saudi", continent: "Asia")
petra = Destination.create(city: "Petra", state: "", country: "Jordan", continent: "Asia")
beirut = Destination.create(city: "Beirut", state: "", country: "Lebanon", continent: "Asia")


UserDestination.create(user_id: kim.id, destination_id: positano.id, visited: true)
UserDestination.create(user_id: kim.id, destination_id: florence.id, visited: true)
UserDestination.create(user_id: kim.id, destination_id: athens.id, visited: true)
UserDestination.create(user_id: kim.id, destination_id: kalambaka.id, visited: true)
UserDestination.create(user_id: kim.id, destination_id: santorini.id, visited: true)
UserDestination.create(user_id: kim.id, destination_id: pamukkale.id, visited: true)
UserDestination.create(user_id: kim.id, destination_id: cappadocia.id, visited: true)
UserDestination.create(user_id: kim.id, destination_id: shanghai.id, visited: true)
UserDestination.create(user_id: kim.id, destination_id: danang.id, visited: true)
UserDestination.create(user_id: kim.id, destination_id: budapest.id, visited: true)
UserDestination.create(user_id: kim.id, destination_id: prague.id, visited: true)
UserDestination.create(user_id: kim.id, destination_id: paris.id, visited: false)
UserDestination.create(user_id: kim.id, destination_id: galapagos.id, visited: false)
UserDestination.create(user_id: kim.id, destination_id: easterisland.id, visited: false)
UserDestination.create(user_id: kim.id, destination_id: halongbay.id, visited: false)
UserDestination.create(user_id: kim.id, destination_id: banff.id, visited: false)
UserDestination.create(user_id: kim.id, destination_id: bali.id, visited: false)
UserDestination.create(user_id: kim.id, destination_id: banos.id, visited: false)
UserDestination.create(user_id: kim.id, destination_id: dubai.id, visited: false)
UserDestination.create(user_id: kim.id, destination_id: jerusalem.id, visited: false)
UserDestination.create(user_id: kim.id, destination_id: chicago.id, visited: true)
UserDestination.create(user_id: kim.id, destination_id: newyorkcity.id, visited: false)
UserDestination.create(user_id: kim.id, destination_id: lasvegas.id, visited: true)
UserDestination.create(user_id: kim.id, destination_id: sanfrancisco.id, visited: true)
UserDestination.create(user_id: kim.id, destination_id: austin.id, visited: true)
UserDestination.create(user_id: kim.id, destination_id: machupicchu.id, visited: false)
# UserDestination.create(user_id: kim.id, destination_id: barcelona.id, visited: false)
# UserDestination.create(user_id: kim.id, destination_id: london.id, visited: false)
UserDestination.create(user_id: kim.id, destination_id: patagonia.id, visited: false)
UserDestination.create(user_id: kim.id, destination_id: maui.id, visited: false)
# UserDestination.create(user_id: kim.id, destination_id: riodejaneiro.id, visited: false)
# UserDestination.create(user_id: kim.id, destination_id: hongkong.id, visited: false)
UserDestination.create(user_id: kim.id, destination_id: tokyo.id, visited: false)
UserDestination.create(user_id: kim.id, destination_id: boston.id, visited: true)
# UserDestination.create(user_id: kim.id, destination_id: sydney.id, visited: false)
UserDestination.create(user_id: kim.id, destination_id: cairo.id, visited: false)
UserDestination.create(user_id: kim.id, destination_id: toronto.id, visited: false)
UserDestination.create(user_id: kim.id, destination_id: istanbul.id, visited: true)
UserDestination.create(user_id: kim.id, destination_id: seattle.id, visited: false)