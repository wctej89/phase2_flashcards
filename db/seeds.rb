deck = Deck.create(name: "U.S. Capitals")

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

  question = "What is the capital of " + state.to_s.capitalize + "?"
  deck.cards << Card.create(question: question, answer: capital)
end

deck2 = Deck.create(name: "Country Capitals")

country = {afghanistan: "Kabul",
austria: "Vienna",
china: "Beijing",
egypt: "Cairo",
finland: "Helsinki",
slovenia: "Ljubljana"}

country.each do |state, capital|

  question = "What is the capital of " + state.to_s.capitalize + "?"
  deck2.cards << Card.create(question: question, answer: capital)
end

deck3 = Deck.create(name: "Periodic Table")

periodic = {h: "hydrogen",
k: "potassium",
ca: "calcium",
ar: "argon",
cd: "cadmium"}

periodic.each do |state, capital|

  question = "What element is " + state.to_s.capitalize + "?"
  deck3.cards << Card.create(question: question, answer: capital)
end

deck3 = Deck.create(name: "U.S. Presidents")

presidents = {first: "George Washington",
second: "John Adams",
third: "Thomas Jefferson",
fourth: "James Madison",
fifth: "James Monroe"}

presidents.each do |state, capital|

  question = "Who was the " + state.to_s + " president?"
  deck3.cards << Card.create(question: question, answer: capital)
end

deck4 = Deck.create(name: "Planets")

planets = {first: "Mercury",
second: "Venus",
third: "Earth",
fourth: "Mars",
fifth: "Jupiter"}

planets.each do |state, capital|

  question = "What is the " + state.to_s + " planet from the sun?"
  deck4.cards << Card.create(question: question, answer: capital)
end

deck5 = Deck.create(name: "Wildcard")

wild = {"What rapper was part of NWA & Westside Connection?" => "Ice Cube",
"Who famously said 'That really cleared things up for me'?" => 'Phillip',
"What is another name for assessment day" => "Happy fun day",
"Who is better Zee or Jeffrey?" => "they are both awesome"}

wild.each do |state, capital|

  question = state
  deck5.cards << Card.create(question: question, answer: capital)
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
