deck = Deck.create(name: "capitals")

capitals = {alabama: "Montgomery",
alaska: "Juneau",
arizona: "Phoenix",
arkansas: "Little Rock",
california: "Sacramento",
colorado: "Denver",
connecticut: "Hartford",
delaware: "Dover",
florida: "Tallahassee",
georgia: "Atlanta"}

capitals.each do |state, capital|
  deck.cards << Card.create(question: state.to_s.capitalize, answer: capital)
end




# Hawaii: Honolulu,
# Idaho: Boise,
# Illinois: Springfield
# Indiana: Indianapolis
# Iowa: Des Moines
# Kansas: Topeka
# Kentucky: Frankfort
# Louisiana: Baton Rouge
# Maine: Augusta
# Maryland: Annapolis
# Massachusetts: Boston
# Michigan: Lansing
# Minnesota: St. Paul
# Mississippi: Jackson
# Missouri: Jefferson City
# Montana: Helena
# Nebraska: Lincoln
# Nevada: Carson City
# New Hampshire: Concord
# New Jersey: Trenton
# New Mexico: Santa Fe
# New York: Albany
# North Carolina: Raleigh
# North Dakota: Bismarck
# Ohio: Columbus
# Oklahoma: Oklahoma City
# Oregon: Salem
# Pennsylvania: Harrisburg
# Rhode Island: Providence
# South Carolina: Columbia
# South Dakota: Pierre
# Tennessee: Nashville
# Texas: Austin
# Utah: Salt Lake City
# Vermont: Montpelier
# Virginia: Richmond
# Washington: Olympia
# West Virginia: Charleston
# Wisconsin: Madison
# Wyoming: Cheyenne
