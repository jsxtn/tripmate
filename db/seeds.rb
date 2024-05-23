# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"


puts "Cleaning database..."
User.destroy_all
Itinerary.destroy_all
Activity.destroy_all

puts "Creating users..."

hafsah = User.create!(email: "Hafsah@thequeen.com", password: "password", first_name: "Hafsah", last_name: "Queen")
joshua = User.create!(email: "Joshua@thelegend.com", password: "password", first_name: "Joshua", last_name: "Legend")
tony = User.create!(email: "tony@theteamplayer.com", password: "password", first_name: "Tony", last_name: "Teamplayer")

puts "Created 3 Users"

puts "Creating itineraries..."

itinerary1 = Itinerary.create!(name: "Spainish adventure in June!", start_date: "03/06/2024", end_date: "13/06/2024", user_id: joshua.id, answer1: "Spain")
itinerary2 = Itinerary.create!(name: "Rome was not build in a day", start_date: "14/07/2024", end_date: "16/07/2024", user_id: hafsah.id, answer1: "Rome")
itinerary3 = Itinerary.create!(name: "Thailand beaches here we come!", start_date: "01/09/2024", end_date: "15/09/2024", user_id: hafsah.id, answer1: "Thailand")


puts "Created  itineraries"

puts "Creating all activities..."


puts "Creating activities for 'Spainish adventure in June!' ..."

  activities = [
    { title: "Explore Park Güell", description: "Visit Gaudí's fantastical park with colorful mosaics and sweeping city views.", address: "08024 Barcelona, Spain", category: "Sightseeing", country: "Spain", city: "Barcelona", phone_number: "+34 934 09 18 31", url: "https://www.parkguell.cat/en/", datetime: "2024-06-03 09:00:00", latitude: 41.4145, longitude: 2.1527 },
    { title: "Lunch at Cervecería Catalana", description: "Enjoy some of the best tapas in Barcelona at this bustling locale.", address: "Carrer de Mallorca, 236, 08008 Barcelona, Spain", category: "Restaurant", country: "Spain", city: "Barcelona", phone_number: "+34 932 16 03 68", url: "https://www.cerveceriacatalana.com/", datetime: "2024-06-03 13:00:00", latitude: 41.3925, longitude: 2.1604 },
    { title: "Evening at Opium Barcelona", description: "Dance the night away at one of Barcelona’s hottest beachfront nightclubs.", address: "Passeig Marítim, 34, 08003 Barcelona, Spain", category: "Nightlife", country: "Spain", city: "Barcelona", phone_number: "+34 932 25 91 00", url: "https://www.opiumbarcelona.com/", datetime: "2024-06-03 22:00:00", latitude: 41.3854, longitude: 2.1964 },
    # Day 2 - June 4, 2024
    { title: "Morning at Sagrada Familia", description: "Explore the iconic and still under-construction basilica designed by Antoni Gaudí.", address: "Carrer de Mallorca, 401, 08013 Barcelona, Spain", category: "Sightseeing", country: "Spain", city: "Barcelona", phone_number: "+34 932 08 04 14", url: "https://sagradafamilia.org/", datetime: "2024-06-04 09:00:00", latitude: 41.4036, longitude: 2.1744 },
    { title: "Visit Casa Batlló", description: "Tour this stunning building, another of Gaudí's masterpieces, known for its unique architecture.", address: "Passeig de Gràcia, 43, 08007 Barcelona, Spain", category: "Sightseeing", country: "Spain", city: "Barcelona", phone_number: "+34 932 16 03 06", url: "https://www.casabatllo.es/en/", datetime: "2024-06-04 12:00:00", latitude: 41.3917, longitude: 2.1649 },
    { title: "Dinner at Tickets", description: "Experience avant-garde tapas at this playful restaurant created by the Adrià brothers.", address: "Avinguda del Parallel, 164, 08015 Barcelona, Spain", category: "Restaurant", country: "Spain", city: "Barcelona", phone_number: "+34 932 92 42 53", url: "http://www.ticketsbar.es/", datetime: "2024-06-04 19:00:00", latitude: 41.3754, longitude: 2.1564 },

    # Day 3 - June 5, 2024
    { title: "Picasso Museum Visit", description: "Explore Picasso's immense artistic legacy in this comprehensive museum.", address: "Carrer Montcada, 15-23, 08003 Barcelona, Spain", category: "Sightseeing", country: "Spain", city: "Barcelona", phone_number: "+34 932 56 30 00", url: "http://www.museupicasso.bcn.cat/", datetime: "2024-06-05 09:00:00", latitude: 41.3851, longitude: 2.1804 },
    { title: "Stroll Through Gothic Quarter", description: "Wander the narrow medieval streets of Barcelona's Gothic Quarter, rich in history and charm.", address: "Barri Gòtic, 08002 Barcelona, Spain", category: "Sightseeing", country: "Spain", city: "Barcelona", phone_number: "N/A", url: "N/A", datetime: "2024-06-05 14:00:00", latitude: 41.3834, longitude: 2.1760 },
    { title: "Sunset at Barceloneta Beach", description: "Enjoy a stunning sunset along Barcelona’s most famous beach.", address: "Passeig Marítim de la Barceloneta, 08003 Barcelona, Spain", category: "Leisure", country: "Spain", city: "Barcelona", phone_number: "N/A", url: "N/A", datetime: "2024-06-05 20:00:00", latitude: 41.3780, longitude: 2.1890 },

    # Day 4 - June 6, 2024
    { title: "Montserrat Day Trip", description: "Take a day trip to the Montserrat mountain range, known for its monastery and breathtaking views.", address: "Montserrat, 08199 Montserrat, Spain", category: "Excursion", country: "Spain", city: "Montserrat", phone_number: "+34 938 77 77 01", url: "https://www.montserratvisita.com/", datetime: "2024-06-06 08:30:00", latitude: 41.5937, longitude: 1.8379 },
    { title: "Lunch at Els 4Gats", description: "Dine at this historic restaurant that was once a meeting place for famous artists including Picasso.", address: "Carrer de Montsió, 3, 08002 Barcelona, Spain", category: "Restaurant", country: "Spain", city: "Barcelona", phone_number: "+34 933 02 41 40", url: "http://www.4gats.com/", datetime: "2024-06-06 13:00:00", latitude: 41.3854, longitude: 2.1735 },
    { title: "Magic Fountain Show", description: "End your day with the spectacular light and water show at the Magic Fountain of Montjuïc.", address: "Plaça de Carles Buïgas, 1, 08038 Barcelona, Spain", category: "Entertainment", country: "Spain", city: "Barcelona", phone_number: "+34 934 02 70 00", url: "http://www.fonts.bcn.cat/", datetime: "2024-06-06 21:00:00", latitude: 41.3711, longitude: 2.1516 },

    # Day 5 - June 7, 2024
    { title: "Tour of Camp Nou", description: "Experience the thrill of FC Barcelona’s home ground with a behind-the-scenes tour.", address: "Carrer d'Arístides Maillol, 12, 08028 Barcelona, Spain", category: "Sightseeing", country: "Spain", city: "Barcelona", phone_number: "+34 902 18 99 00", url: "https://www.fcbarcelona.com/en/", datetime: "2024-06-07 10:00:00", latitude: 41.3809, longitude: 2.1228 },
    { title: "Lunch at La Paradeta", description: "Enjoy fresh seafood at this unique self-service seafood restaurant.", address: "Passatge de Simó, 18, 08025 Barcelona, Spain", category: "Restaurant", country: "Spain", city: "Barcelona", phone_number: "+34 934 50 01 91", url: "https://www.laparadeta.com/", datetime: "2024-06-07 13:00:00", latitude: 41.4039, longitude: 2.1741 },
    { title: "Relax at Ciutadella Park", description: "Unwind in one of Barcelona’s largest and most beloved parks.", address: "Passeig de Picasso, 21, 08003 Barcelona, Spain", category: "Leisure", country: "Spain", city: "Barcelona", phone_number: "+34 638 23 71 15", url: "https://www.barcelona.cat/en/", datetime: "2024-06-07 17:00:00", latitude: 41.3882, longitude: 2.1859 },

    # Day 6 - June 8, 2024
    { title: "Visit La Pedrera", description: "Tour this iconic modernist building, also known as Casa Milà, designed by Gaudí.", address: "Passeig de Gràcia, 92, 08008 Barcelona, Spain", category: "Sightseeing", country: "Spain", city: "Barcelona", phone_number: "+ 34 902 20 21 38", url: "https://www.lapedrera.com/en", datetime: "2024-06-08 09:00:00", latitude: 41.3955, longitude: 2.1619 },
    { title: "Brunch at Milk Bar & Bistro", description: "Enjoy a delicious brunch in a cozy setting.", address: "Carrer d'en Gignàs, 21, 08002 Barcelona, Spain", category: "Restaurant", country: "Spain", city: "Barcelona", phone_number: "+34 932 68 09 22", url: "https://www.milkbarcelona.com/", datetime: "2024-06-08 12:00:00", latitude: 41.3811, longitude: 2.1808 },
    { title: "Evening at Elrow", description: "Attend one of the wildest and most colorful parties in Barcelona.", address: "Autovia de Castelldefels, 288, 08820 El Prat de Llobregat, Barcelona, Spain", category: "Nightlife", country: "Spain", city: "Barcelona", phone_number: "+34 936 47 92 00", url: "https://www.elrow.com/", datetime: "2024-06-08 22:00:00", latitude: 41.3272, longitude: 2.0748 },

    # Day 7 - June 9, 2024
    { title: "Visit Barcelona Aquarium", description: "Discover marine life at one of the largest aquariums in Europe.", address: "Moll d'Espanya, del Port Vell, s/n, 08039 Barcelona, Spain", category: "Sightseeing", country: "Spain", city: "Barcelona", phone_number: "+34 932 21 74 74", url: "https://www.aquariumbcn.com/", datetime: "2024-06-09 10:00:00", latitude: 41.3785, longitude: 2.1868 },
    { title: "Lunch at Bar Cañete", description: "Savor traditional Spanish dishes at this popular tapas bar.", address: "Carrer de la Unió, 17, 08001 Barcelona, Spain", category: "Restaurant", country: "Spain", city: "Barcelona", phone_number: "+34 932 70 34 58", url: "https://www.barcanete.com/", datetime: "2024-06-09 13:00:00", latitude: 41.3784, longitude: 2.1695 },
    { title: "Evening at Sala Apolo", description: "Enjoy live music and DJ sets at one of Barcelona’s iconic music venues.", address: "Carrer Nou de la Rambla, 113, 08004 Barcelona, Spain", category: "Nightlife", country: "Spain", city: "Barcelona", phone_number: "+34 934 41 40 01", url: "https://www.sala-apolo.com/", datetime: "2024-06-09 21:00:00", latitude: 41.3752, longitude: 2.1682 },

    # Day 8 - June 10, 2024
    { title: "Visit Museu Nacional d'Art de Catalunya", description: "Explore Catalonia's rich art history in this impressive museum.", address: "Palau Nacional, Parc de Montjuïc, s/n, 08038 Barcelona, Spain", category: "Sightseeing", country: "Spain", city: "Barcelona", phone_number: "+34 936 22 03 60", url: "https://www.museunacional.cat/en", datetime: "2024-06-10 10:00:00", latitude: 41.3689, longitude: 2.1533 },
    { title: "Lunch at Can Solé", description: "Enjoy delicious seafood at this long-standing Barcelona restaurant.", address: "Carrer de Sant Carles, 4, 08003 Barcelona, Spain", category: "Restaurant", country: "Spain", city: "Barcelona", phone_number: "+34 932 21 50 12", url: "http://www.restaurantecansole.com/", datetime: "2024-06-10 13:00:00", latitude: 41.3813, longitude: 2.1915 },
    { title: "Evening at Poble Espanyol", description: "Experience Spanish culture through architecture, craft shops, and live performances.", address: "Av. Francesc Ferrer i Guàrdia, 13, 08038 Barcelona, Spain", category: "Entertainment", country: "Spain", city: "Barcelona", phone_number: "+34 935 08 63 00", url: "https://www.poble-espanyol.com/en/", datetime: "2024-06-10 19:00:00", latitude: 41.3691, longitude: 2.1482 },

    # Day 9 - June 11, 2024
    { title: "Morning at Montjuïc Castle", description: "Explore the historic fortress with panoramic views over Barcelona.", address: "Ctra. de Montjuïc, 66, 08038 Barcelona, Spain", category: "Sightseeing", country: "Spain", city: "Barcelona", phone_number: "+34 932 56 44 45", url: "https://www.barcelona.cat/en/", datetime: "2024-06-11 09:00:00", latitude: 41.3636, longitude: 2.1653 },
    { title: "Lunch at Quimet & Quimet", description: "Enjoy tapas at this small yet famous eatery known for its montaditos.", address: "Carrer del Poeta Cabanyes, 25, 08004 Barcelona, Spain", category: "Restaurant", country: "Spain", city: "Barcelona", phone_number: "+34 934 42 31 42", url: "N/A", datetime: "2024-06-11 13:00:00", latitude: 41.3733, longitude: 2.1650 },
    { title: "Evening at Icebarcelona", description: "Chill out at this unique bar made entirely of ice, located on the beach.", address: "Ramon Trias Fargas, 2, 08005 Barcelona, Spain", category: "Nightlife", country: "Spain", city: "Barcelona", phone_number: "+34 932 24 16 25", url: "https://www.icebarcelona.com/", datetime: "2024-06-11 22:00:00", latitude: 41.3851, longitude: 2.1969 },

    # Day 10 - June 12, 2024
    { title: "Visit Palau de la Música Catalana", description: "Tour this stunning concert hall, a masterpiece of Catalan modernism.", address: "C/ Palau de la Música, 4-6, 08003 Barcelona, Spain", category: "Sightseeing", country: "Spain", city: "Barcelona", phone_number: "+34 932 95 72 00", url: "https://www.palaumusica.cat/en", datetime: "2024-06-12 10:00:00", latitude: 41.3870, longitude: 2.1755 },
    { title: "Lunch at Cal Pep", description: "Enjoy delicious seafood and tapas at this popular restaurant.", address: "Plaça de les Olles, 8, 08003 Barcelona, Spain", category: "Restaurant", country: "Spain", city: "Barcelona", phone_number: "+34 933 10 79 61", url: "https://www.calpep.com/", datetime: "2024-06-12 13:00:00", latitude: 41.3839, longitude: 2.1818 },
    { title: "Evening at Harlem Jazz Club", description: "Listen to live jazz music at one of Barcelona’s oldest jazz clubs.", address: "Carrer de Comtessa de Sobradiel, 8, 08002 Barcelona, Spain", category: "Nightlife", country: "Spain", city: "Barcelona", phone_number: "+34 933 10 07 55", url: "http://www.harlemjazzclub.es/", datetime: "2024-06-12 21:00:00", latitude: 41.3832, longitude: 2.1807 },

    # Day 11 - June 13, 2024
    { title: "Visit Joan Miró Foundation", description: "Explore the works of renowned Catalan artist Joan Miró.", address: "Parc de Montjuïc, s/n, 08038 Barcelona, Spain", category: "Sightseeing", country: "Spain", city: "Barcelona", phone_number: "+34 934 43 94 70", url: "https://www.fmirobcn.org/en/", datetime: "2024-06-13 09:00:00", latitude: 41.3688, longitude: 2.1630 },
    { title: "Lunch at Bodega 1900", description: "Enjoy traditional tapas and vermouth at this beloved local spot.", address: "Carrer de Tamarit, 91, 08015 Barcelona, Spain", category: "Restaurant", country: "Spain", city: "Barcelona", phone_number: "+34 933 25 26 59", url: "https://bodega1900.com/", datetime: "2024-06-13 13:00:00", latitude: 41.3761, longitude: 2.1583 },
    { title: "Farewell Drinks at Boca Chica", description: "Enjoy your final evening in Barcelona with cocktails at this trendy bar.", address: "Passatge de la Concepció, 12, 08008 Barcelona, Spain", category: "Nightlife", country: "Spain", city: "Barcelona", phone_number: "+34 933 68 20 92", url: "https://bocagrande.cat/bocachica/", datetime: "2024-06-13 21:00:00", latitude: 41.3921, longitude: 2.1617 },
  ]

  activities.each do |activity|

    Activity.create!(
      title: activity[:title],
      description: activity[:description],
      address: activity[:address],
      category: activity[:category],
      country: activity[:country],
      city: activity[:city],
      phone_number: activity[:phone_number],
      url: activity[:url],
      datetime: activity[:datetime],
      latitude: activity[:latitude],
      longitude: activity[:longitude],
      itinerary_id: itinerary1.id
    )


  end


puts "Created 33 activities for 'Spainish adventure in June!' ..."


puts "Creating activities for 'Thailand beaches here we come!' ..."

  activities = [
    # Day 1 - September 1, 2024
    { title: "Visit Grand Palace", description: "Explore the opulent Grand Palace, the former residence of Thai kings.", address: "Na Phra Lan Rd, Phra Nakhon, Bangkok 10200, Thailand", category: "Sightseeing", country: "Thailand", city: "Bangkok", phone_number: "+66 2 623 5500", url: "https://www.royalgrandpalace.th/en", datetime: "2024-09-01 09:00:00", latitude: 13.7515, longitude: 100.4923 },
    { title: "Lunch at Thip Samai", description: "Enjoy the best Pad Thai in Bangkok at this famous eatery.", address: "313 Maha Chai Rd, Samran Rat, Phra Nakhon, Bangkok 10200, Thailand", category: "Restaurant", country: "Thailand", city: "Bangkok", phone_number: "+66 2 226 6666", url: "https://thipsamai.com/", datetime: "2024-09-01 12:00:00", latitude: 13.7528, longitude: 100.5044 },
    { title: "Evening at Khao San Road", description: "Experience the vibrant nightlife on Bangkok’s famous Khao San Road.", address: "Khao San Rd, Talat Yot, Phra Nakhon, Bangkok 10200, Thailand", category: "Nightlife", country: "Thailand", city: "Bangkok", phone_number: "N/A", url: "N/A", datetime: "2024-09-01 21:00:00", latitude: 13.7586, longitude: 100.4976 },

    # Day 2 - September 2, 2024
    { title: "Explore Wat Arun", description: "Visit the Temple of Dawn, one of Bangkok’s most famous landmarks.", address: "158 Wang Doem Rd, Wat Arun, Bangkok Yai, Bangkok 10600, Thailand", category: "Sightseeing", country: "Thailand", city: "Bangkok", phone_number: "+66 2 891 2185", url: "https://www.watarun.net/", datetime: "2024-09-02 09:00:00", latitude: 13.7437, longitude: 100.4881 },
    { title: "Lunch at Som Tum Nua", description: "Taste the famous Thai papaya salad at this popular restaurant.", address: "392/14 Siam Square Soi 5, Pathum Wan, Bangkok 10330, Thailand", category: "Restaurant", country: "Thailand", city: "Bangkok", phone_number: "+66 2 251 4880", url: "https://www.facebook.com/Somtumnua/", datetime: "2024-09-02 12:00:00", latitude: 13.7446, longitude: 100.5328 },
    { title: "Dinner at Vertigo and Moon Bar", description: "Enjoy panoramic views of Bangkok from this rooftop bar.", address: "21/100 S Sathon Rd, Sathon, Bangkok 10120, Thailand", category: "Nightlife", country: "Thailand", city: "Bangkok", phone_number: "+66 2 679 1200", url: "https://www.banyantree.com/en/thailand/bangkok/dining/vertigo-and-moon-bar", datetime: "2024-09-02 20:00:00", latitude: 13.7230, longitude: 100.5300 },

    # Day 3 - September 3, 2024
    { title: "Visit Chatuchak Market", description: "Explore one of the world's largest weekend markets with over 15,000 stalls.", address: "Kamphaeng Phet 2 Rd, Chatuchak, Bangkok 10900, Thailand", category: "Shopping", country: "Thailand", city: "Bangkok", phone_number: "+66 2 272 4441", url: "https://www.chatuchakmarket.org/", datetime: "2024-09-03 09:00:00", latitude: 13.8007, longitude: 100.5530 },
    { title: "Lunch at Cabbages & Condoms", description: "Dine at this unique restaurant that promotes safe sex education.", address: "10 Sukhumvit 12 Alley, Khlong Toei, Bangkok 10110, Thailand", category: "Restaurant", country: "Thailand", city: "Bangkok", phone_number: "+66 2 229 4610", url: "https://www.pda.or.th/restaurant.php", datetime: "2024-09-03 12:00:00", latitude: 13.7378, longitude: 100.5606 },
    { title: "Evening at Asiatique The Riverfront", description: "Enjoy shopping, dining, and entertainment at this open-air mall by the river.", address: "2194 Charoen Krung Rd, Wat Phraya Krai, Bang Kho Laem, Bangkok 10120, Thailand", category: "Nightlife", country: "Thailand", city: "Bangkok", phone_number: "+66 92 246 0812", url: "https://www.asiatiquethailand.com/", datetime: "2024-09-03 19:00:00", latitude: 13.7042, longitude: 100.5094 },

    # Day 4 - September 4, 2024
    { title: "Visit Damnoen Saduak Floating Market", description: "Experience the bustling activity of Thailand’s most famous floating market.", address: "Damnoen Saduak District, Ratchaburi 70130, Thailand", category: "Sightseeing", country: "Thailand", city: "Ratchaburi", phone_number: "+66 3 222 3188", url: "https://www.thailandtourismdirectory.go.th/en/attraction/324", datetime: "2024-09-04 08:00:00", latitude: 13.5167, longitude: 99.9560 },
    { title: "Lunch at Krua Apsorn", description: "Enjoy traditional Thai cuisine at this beloved local restaurant.", address: "503-505 Samsen Rd, Thanon Nakhon Chai Si, Dusit, Bangkok 10300, Thailand", category: "Restaurant", country: "Thailand", city: "Bangkok", phone_number: "+66 2 241 8528", url: "N/A", datetime: "2024-09-04 12:00:00", latitude: 13.7725, longitude: 100.5090 },
    { title: "Evening at Talad Rot Fai Srinakarin Night Market", description: "Explore this trendy night market known for its vintage goods and street food.", address: "Srinagarindra Rd, Suan Luang, Bangkok 10250, Thailand", category: "Nightlife", country: "Thailand", city: "Bangkok", phone_number: "N/A", url: "https://www.facebook.com/taradrodfi/", datetime: "2024-09-04 19:00:00", latitude: 13.6979, longitude: 100.6476 },

    # Day 5 - September 5, 2024
    { title: "Visit Wat Pho", description: "See the famous reclining Buddha at Wat Pho, one of Bangkok’s largest temples.", address: "2 Sanam Chai Rd, Phra Borom Maha Ratchawang, Phra Nakhon, Bangkok 10200, Thailand", category: "Sightseeing", country: "Thailand", city: "Bangkok", phone_number: "+66 2 226 0335", url: "https://www.watpho.com/", datetime: "2024-09-05 09:00:00", latitude: 13.7467, longitude: 100.4930 },
    { title: "Lunch at Bo.Lan", description: "Enjoy a sustainable fine dining experience with traditional Thai flavors.", address: "24 Sukhumvit 53 Alley, Khlong Tan Nuea, Watthana, Bangkok 10110, Thailand", category: "Restaurant", country: "Thailand", city: "Bangkok", phone_number: "+66 2 260 2962", url: "http://www.bolan.co.th/", datetime: "2024-09-05 12:00:00", latitude: 13.7322, longitude: 100.5790 },
    { title: "Evening at Soi Cowboy", description: "Experience the nightlife at Soi Cowboy, one of Bangkok's famous red-light districts.", address: "Soi Cowboy, Khlong Toei Nuea, Watthana, Bangkok 10110, Thailand", category: "Nightlife", country: "Thailand", city: "Bangkok", phone_number: "N/A", url: "N/A", datetime: "2024-09-05 21:00:00", latitude: 13.7366, longitude: 100.5620 },

    # Day 6 - September 6, 2024
    { title: "Visit Ayutthaya Historical Park", description: "Explore the ruins of the ancient capital city of Ayutthaya.", address: "Ayutthaya Historical Park, Phra Nakhon Si Ayutthaya, Thailand", category: "Sightseeing", country: "Thailand", city: "Ayutthaya", phone_number: "+66 35 242 284", url: "https://www.ayutthaya.go.th/", datetime: "2024-09-06 08:00:00", latitude: 14.3552, longitude: 100.5651 },
    { title: "Lunch at Raan Jay Fai", description: "Dine at the only street food eatery in Bangkok awarded a Michelin star.", address: "327 Mahachai Rd, Samran Rat, Phra Nakhon, Bangkok 10200, Thailand", category: "Restaurant", country: "Thailand", city: "Bangkok", phone_number: "+66 2 223 9384", url: "N/A", datetime: "2024-09-06 13:00:00", latitude: 13.7555, longitude: 100.5070 },
    { title: "Evening at Sky Bar", description: "Enjoy drinks at one of the world’s highest rooftop bars with stunning city views.", address: "The Dome at lebua, 1055 Silom Rd, Silom, Bang Rak, Bangkok 10500, Thailand", category: "Nightlife", country: "Thailand", city: "Bangkok", phone_number: "+66 2 624 9555", url: "https://lebua.com/sky-bar/", datetime: "2024-09-06 20:00:00", latitude: 13.7234, longitude: 100.5171 },

    # Day 7 - September 7, 2024
    { title: "Visit Wat Phra That Doi Suthep", description: "Explore the sacred temple on Doi Suthep mountain with panoramic views.", address: "9 หมู่ที่ 9 Mueang Chiang Mai District, Chiang Mai 50200, Thailand", category: "Sightseeing", country: "Thailand", city: "Chiang Mai", phone_number: "+66 53 295 003", url: "http://www.doisuthep.com/", datetime: "2024-09-07 08:00:00", latitude: 18.8047, longitude: 98.9215 },
    { title: "Lunch at Khao Soi Khun Yai", description: "Enjoy the best Khao Soi in Chiang Mai at this local favorite.", address: "Soi 1, 202 ถ. มณีนพรัตน์ Si Phum Sub-district, Mueang Chiang Mai District, Chiang Mai 50200, Thailand", category: "Restaurant", country: "Thailand", city: "Chiang Mai", phone_number: "+66 53 211 847", url: "N/A", datetime: "2024-09-07 12:00:00", latitude: 18.7964, longitude: 98.9844 },
    { title: "Evening at Sunday Walking Street Market", description: "Explore this vibrant market featuring local crafts, food, and performances.", address: "Rachadamnoen Rd, Si Phum Sub-district, Mueang Chiang Mai District, Chiang Mai 50200, Thailand", category: "Nightlife", country: "Thailand", city: "Chiang Mai", phone_number: "N/A", url: "N/A", datetime: "2024-09-07 18:00:00", latitude: 18.7883, longitude: 98.9853 },

    # Day 8 - September 8, 2024
    { title: "Visit Elephant Nature Park", description: "Spend a day with rescued elephants at this ethical sanctuary.", address: "209/2 Sridom Chai Road, T. Prasing, A. Muang, Chiang Mai 50100, Thailand", category: "Excursion", country: "Thailand", city: "Chiang Mai", phone_number: "+66 53 272 855", url: "https://www.elephantnaturepark.org/", datetime: "2024-09-08 08:00:00", latitude: 18.9293, longitude: 98.8590 },
    { title: "Lunch at The River Market", description: "Enjoy lunch with a view at this riverside restaurant.", address: "Charoen Rat Road, Wat Ket Sub-district, Mueang Chiang Mai District, Chiang Mai 50000, Thailand", category: "Restaurant", country: "Thailand", city: "Chiang Mai", phone_number: "+66 53 234 493", url: "http://therivermarket.com/", datetime: "2024-09-08 12:00:00", latitude: 18.7881, longitude: 99.0024 },
    { title: "Evening at Zoe in Yellow", description: "Party at this popular nightclub in Chiang Mai's old city.", address: "40/12 Ratvithi Rd, Si Phum Sub-district, Mueang Chiang Mai District, Chiang Mai 50200, Thailand", category: "Nightlife", country: "Thailand", city: "Chiang Mai", phone_number: "+66 84 222 6522", url: "https://www.facebook.com/zoeinyellowcm/", datetime: "2024-09-08 21:00:00", latitude: 18.7890, longitude: 98.9884 },

    # Day 9 - September 9, 2024
    { title: "Visit Wat Rong Khun", description: "See the stunning White Temple, an unconventional art exhibit in the style of a Buddhist temple.", address: "Pa O Don Chai Sub-district, Mueang Chiang Rai District, Chiang Rai 57000, Thailand", category: "Sightseeing", country: "Thailand", city: "Chiang Rai", phone_number: "+66 53 673 579", url: "http://www.watrongkhun.org/", datetime: "2024-09-09 09:00:00", latitude: 19.8242, longitude: 99.7634 },
    { title: "Lunch at Chivit Thamma Da Coffee House", description: "Enjoy lunch at this charming riverside coffee house and bistro.", address: "179 Moo 2 Rimkok Sub-district, Mueang Chiang Rai District, Chiang Rai 57100, Thailand", category: "Restaurant", country: "Thailand", city: "Chiang Rai", phone_number: "+66 81 984 2925", url: "https://www.chivitthammada.com/", datetime: "2024-09-09 12:00:00", latitude: 19.9106, longitude: 99.8416 },
    { title: "Evening at Cat 'n' A Cup Cat Café", description: "Relax with a coffee and friendly cats at this unique café.", address: "80/36 Paholyothin Rd, Wiang Sub-district, Mueang Chiang Rai District, Chiang Rai 57000, Thailand", category: "Cafe", country: "Thailand", city: "Chiang Rai", phone_number: "+66 53 719 412", url: "https://www.facebook.com/catnacupcafe/", datetime: "2024-09-09 18:00:00", latitude: 19.9057, longitude: 99.8320 },

    # Day 10 - September 10, 2024
    { title: "Visit Doi Inthanon National Park", description: "Explore Thailand’s highest peak and the surrounding natural beauty.", address: "Doi Inthanon National Park, Ban Luang, Chom Thong District, Chiang Mai 50160, Thailand", category: "Excursion", country: "Thailand", city: "Chiang Mai", phone_number: "+66 53 286 729", url: "https://www.dnp.go.th/", datetime: "2024-09-10 08:00:00", latitude: 18.5881, longitude: 98.4878 },
    { title: "Lunch at Dash! Restaurant and Bar", description: "Enjoy a mix of Thai and Western dishes in a traditional teak house.", address: "38/2 Moon Muang Rd Lane 2, Phra Sing, Mueang Chiang Mai District, Chiang Mai 50200, Thailand", category: "Restaurant", country: "Thailand", city: "Chiang Mai", phone_number: "+66 53 279 393", url: "https://www.dashteakhouse.com/", datetime: "2024-09-10 12:00:00", latitude: 18.7868, longitude: 98.9895 },
    { title: "Evening at The North Gate Jazz Co-Op", description: "Listen to live jazz at this popular bar in Chiang Mai.", address: "91/1-2 Si Phum Sub-district, Mueang Chiang Mai District, Chiang Mai 50200, Thailand", category: "Nightlife", country: "Thailand", city: "Chiang Mai", phone_number: "+66 81 765 5246", url: "https://www.facebook.com/northgatejazzcoop/", datetime: "2024-09-10 21:00:00", latitude: 18.7941, longitude: 98.9887 },

    # Day 11 - September 11, 2024
    { title: "Visit Wat Phra Singh", description: "Explore this beautiful temple known for its classic Lanna architecture.", address: "2 Samlarn Rd, Phra Sing, Mueang Chiang Mai District, Chiang Mai 50200, Thailand", category: "Sightseeing", country: "Thailand", city: "Chiang Mai", phone_number: "+66 53 416 424", url: "http://www.watphrasingh.com/", datetime: "2024-09-11 09:00:00", latitude: 18.7888, longitude: 98.9816 },
    { title: "Lunch at Huen Phen", description: "Enjoy traditional Northern Thai cuisine at this popular local restaurant.", address: "112 Rachamanka Rd, Phra Sing, Mueang Chiang Mai District, Chiang Mai 50200, Thailand", category: "Restaurant", country: "Thailand", city: "Chiang Mai", phone_number: "+66 53 814 548", url: "N/A", datetime: "2024-09-11 12:00:00", latitude: 18.7877, longitude: 98.9813 },
    { title: "Evening at Warm Up Café", description: "Party at one of Chiang Mai’s most popular nightlife spots.", address: "40 Nimmanhaemin Rd Lane 2, Suthep, Mueang Chiang Mai District, Chiang Mai 50200, Thailand", category: "Nightlife", country: "Thailand", city: "Chiang Mai", phone_number: "+66 53 400 677", url: "https://www.warmupcafe1999.com/", datetime: "2024-09-11 21:00:00", latitude: 18.7983, longitude: 98.9671 },

    # Day 12 - September 12, 2024
    { title: "Visit Chiang Mai Night Safari", description: "Experience the wildlife at night in this exciting night safari park.", address: "33 Nong Kwai, Hang Dong District, Chiang Mai 50230, Thailand", category: "Excursion", country: "Thailand", city: "Chiang Mai", phone_number: "+66 53 999 000", url: "https://www.chiangmainightsafari.com/", datetime: "2024-09-12 18:00:00", latitude: 18.7403, longitude: 98.9214 },
    { title: "Lunch at Goodview Village", description: "Dine at this scenic riverside restaurant offering Thai and international cuisine.", address: "Royal Flora Ratchaphruek, 194 M. 9 T. Mae Hia, A. Muang, Chiang Mai 50300, Thailand", category: "Restaurant", country: "Thailand", city: "Chiang Mai", phone_number: "+66 53 904 406", url: "https://www.goodview.co.th/", datetime: "2024-09-12 12:00:00", latitude: 18.7390, longitude: 98.9428 },
    { title: "Evening at The Good View Bar & Restaurant", description: "Enjoy live music and great food at this popular riverside bar.", address: "13 Charoen Rat Rd, Wat Ket Sub-district, Mueang Chiang Mai District, Chiang Mai 50000, Thailand", category: "Nightlife", country: "Thailand", city: "Chiang Mai", phone_number: "+66 53 302 764", url: "https://www.facebook.com/thegoodviewbarandrestaurant/", datetime: "2024-09-12 20:00:00", latitude: 18.7904, longitude: 99.0024 },

    # Day 13 - September 13, 2024
    { title: "Visit Sukhothai Historical Park", description: "Explore the ruins of the ancient capital of Sukhothai.", address: "Mueang Kao, Mueang Sukhothai District, Sukhothai 64210, Thailand", category: "Sightseeing", country: "Thailand", city: "Sukhothai", phone_number: "+66 55 697 310", url: "https://www.tourismthailand.org/Attraction/Sukhothai-Historical-Park--4195", datetime: "2024-09-13 09:00:00", latitude: 17.0141, longitude: 99.7035 },
    { title: "Lunch at Dream Café", description: "Enjoy Thai and Western cuisine in a charming and rustic setting.", address: "38/1 Singhawat Road, Thani, Mueang Sukhothai District, Sukhothai 64000, Thailand", category: "Restaurant", country: "Thailand", city: "Sukhothai", phone_number: "+66 55 611 190", url: "https://www.facebook.com/dreamcafe.sukhothai", datetime: "2024-09-13 12:00:00", latitude: 17.0128, longitude: 99.8214 },
    { title: "Evening at Poo Restaurant", description: "Dine on fresh and tasty local dishes at this popular restaurant.", address: "179/1 Wichian Alley, Thani, Mueang Sukhothai District, Sukhothai 64000, Thailand", category: "Restaurant", country: "Thailand", city: "Sukhothai", phone_number: "+66 55 613 327", url: "N/A", datetime: "2024-09-13 18:00:00", latitude: 17.0125, longitude: 99.8211 },

    # Day 14 - September 14, 2024
    { title: "Visit Erawan National Park", description: "Explore the stunning waterfalls and natural beauty of Erawan National Park.", address: "Moo 4 Tha Kradan, Erawan National Park, Si Sawat District, Kanchanaburi 71250, Thailand", category: "Excursion", country: "Thailand", city: "Kanchanaburi", phone_number: "+66 34 574 222", url: "https://www.thainationalparks.com/erawan-national-park", datetime: "2024-09-14 08:00:00", latitude: 14.3805, longitude: 99.1450 },
    { title: "Lunch at Blue Rice Restaurant by Apple & Noi", description: "Enjoy delicious Thai cuisine in a beautiful garden setting.", address: "1/7 Mae Nam Kwai Road, Tamakham, Mueang Kanchanaburi District, Kanchanaburi 71000, Thailand", category: "Restaurant", country: "Thailand", city: "Kanchanaburi", phone_number: "+66 34 514 906", url: "http://www.applenoi-kanchanaburi.com/", datetime: "2024-09-14 12:00:00", latitude: 14.0364, longitude: 99.5296 },
    { title: "Evening at the Bridge on the River Kwai", description: "Visit this historic bridge and enjoy the serene views.", address: "River Kwai Bridge, Tha Ma Kham, Mueang Kanchanaburi District, Kanchanaburi 71000, Thailand", category: "Sightseeing", country: "Thailand", city: "Kanchanaburi", phone_number: "N/A", url: "N/A", datetime: "2024-09-14 18:00:00", latitude: 14.0422, longitude: 99.5036 },

    # Day 15 - September 15, 2024
    { title: "Visit Wat Mahathat", description: "Explore the iconic temple with its famous Buddha head entwined in tree roots.", address: "1 Naresuan Rd, Phra Nakhon Si Ayutthaya District, Phra Nakhon Si Ayutthaya 13000, Thailand", category: "Sightseeing", country: "Thailand", city: "Ayutthaya", phone_number: "N/A", url: "https://www.ayutthaya.go.th/", datetime: "2024-09-15 09:00:00", latitude: 14.3550, longitude: 100.5650 },
    { title: "Lunch at The Summer House Ayutthaya", description: "Enjoy a riverside meal at this cozy café and restaurant.", address: "71/1 Khlong Tho Road, Ayutthaya, Thailand", category: "Restaurant", country: "Thailand", city: "Ayutthaya", phone_number: "+66 89 909 9819", url: "https://www.facebook.com/thesummerhouseayutthaya/", datetime: "2024-09-15 12:00:00", latitude: 14.3516, longitude: 100.5679 },
    { title: "Evening at Ayutthaya Night Market", description: "Explore the local night market with a variety of food and crafts.", address: "Pathon Road, Ayutthaya, Thailand", category: "Nightlife", country: "Thailand", city: "Ayutthaya", phone_number: "N/A", url: "N/A", datetime: "2024-09-15 18:00:00", latitude: 14.3538, longitude: 100.5672 },

    # Islands - Throughout the trip
    { title: "Visit Phi Phi Islands", description: "Discover the stunning Phi Phi Islands with crystal clear waters and beautiful beaches.", address: "Phi Phi Islands, Krabi 81000, Thailand", category: "Sightseeing", country: "Thailand", city: "Krabi", phone_number: "N/A", url: "https://www.tourismthailand.org/Destination/Phi-Phi-Islands", datetime: "2024-09-07 09:00:00", latitude: 7.7407, longitude: 98.7784 },
    { title: "Snorkeling at Similan Islands", description: "Experience the underwater beauty of the Similan Islands.", address: "Similan Islands, Phang Nga 82120, Thailand", category: "Excursion", country: "Thailand", city: "Phang Nga", phone_number: "N/A", url: "https://www.similan-islands.com/", datetime: "2024-09-08 10:00:00", latitude: 8.6750, longitude: 97.6414 },
    { title: "Relax at Railay Beach", description: "Enjoy the scenic beauty and rock climbing opportunities at Railay Beach.", address: "Railay Beach, Krabi 81000, Thailand", category: "Beach", country: "Thailand", city: "Krabi", phone_number: "N/A", url: "https://www.tourismthailand.org/Destination/Railay-Beach", datetime: "2024-09-09 15:00:00", latitude: 8.0113, longitude: 98.8380 },
    { title: "Visit James Bond Island", description: "Explore the famous island from the James Bond movie.", address: "James Bond Island, Phang Nga Bay, Thailand", category: "Sightseeing", country: "Thailand", city: "Phang Nga", phone_number: "N/A", url: "https://www.tourismthailand.org/Destination/James-Bond-Island", datetime: "2024-09-10 13:00:00", latitude: 8.2744, longitude: 98.5011 },
    { title: "Full Moon Party at Koh Phangan", description: "Experience the legendary Full Moon Party at Haad Rin Beach.", address: "Haad Rin, Koh Phangan 84280, Thailand", category: "Nightlife", country: "Thailand", city: "Koh Phangan", phone_number: "N/A", url: "https://www.fullmoonparty-thailand.com/", datetime: "2024-09-11 21:00:00", latitude: 9.6750, longitude: 100.0671 },
    { title: "Visit Koh Tao", description: "Enjoy snorkeling and diving in the crystal clear waters of Koh Tao.", address: "Koh Tao, Surat Thani 84360, Thailand", category: "Excursion", country: "Thailand", city: "Surat Thani", phone_number: "N/A", url: "https://www.kohtaocompleteguide.com/", datetime: "2024-09-12 11:00:00", latitude: 10.0963, longitude: 99.8383 },
    { title: "Relax at Patong Beach", description: "Enjoy the vibrant nightlife and beautiful beach at Patong.", address: "Patong Beach, Phuket 83150, Thailand", category: "Beach", country: "Thailand", city: "Phuket", phone_number: "N/A", url: "https://www.tourismthailand.org/Destination/Patong-Beach", datetime: "2024-09-13 14:00:00", latitude: 7.8960, longitude: 98.2962 },
    { title: "Visit Ang Thong National Marine Park", description: "Explore the beautiful islands and marine life at Ang Thong National Marine Park.", address: "Ang Thong, Surat Thani 84140, Thailand", category: "Excursion", country: "Thailand", city: "Surat Thani", phone_number: "N/A", url: "https://www.tourismthailand.org/Destination/Ang-Thong-National-Marine-Park", datetime: "2024-09-14 09:00:00", latitude: 9.6736, longitude: 99.6751 },
    { title: "Visit Koh Samui", description: "Relax on the beautiful beaches and explore the vibrant nightlife of Koh Samui.", address: "Koh Samui, Surat Thani 84140, Thailand", category: "Beach", country: "Thailand", city: "Surat Thani", phone_number: "N/A", url: "https://www.tourismthailand.org/Destination/Koh-Samui", datetime: "2024-09-15 15:00:00", latitude: 9.5120, longitude: 100.0133 },
  ]

  activities.each do |activity|
    Activity.create!(
      title: activity[:title],
      description: activity[:description],
      address: activity[:address],
      category: activity[:category],
      country: activity[:country],
      city: activity[:city],
      phone_number: activity[:phone_number],
      url: activity[:url],
      datetime: activity[:datetime],
      latitude: activity[:latitude],
      longitude: activity[:longitude],
      itinerary_id: itinerary3.id
    )

  end

puts "Created 45 activities"



puts "Finished!"
