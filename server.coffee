###global require, __dirname, process###

((express, dir, port = 3005) ->
	dir += '/dist'

	nextId = 0

	people = [
		{"id": "#{nextId++}", "name": "Saasha", "age": "5"}
		{"id": "#{nextId++}", "name": "Planet", "age": "7"}
	]

	actors = [

		"firstName": "Fred"
		"lastName": "Astaire"
	,

		"firstName": "Lauren"
		"lastName": "Bacall"
	,

		"firstName": "Brigitte"
		"lastName": "Bardot"
	,

		"firstName": "John"
		"lastName": "Belushi"
	,

		"firstName": "Ingmar"
		"lastName": "Bergman"
	,

		"firstName": "Ingrid"
		"lastName": "Bergman"
	,

		"firstName": "Humphrey"
		"lastName": "Bogart"
	,

		"firstName": "Marlon"
		"lastName": "Brando"
	,

		"firstName": "James"
		"lastName": "Cagney"
	,

		"firstName": "Gary"
		"lastName": "Cooper"
	,

		"firstName": "Bette"
		"lastName": "Davis"
	,

		"firstName": "Doris"
		"lastName": "Day"
	,

		"firstName": "Olivia"
		"lastName": "de Havilland"
	,

		"firstName": "James"
		"lastName": "Dean"
	,

		"firstName": "Georges"
		"lastName": "Delerue"
	,

		"firstName": "Marlene"
		"lastName": "Dietrich"
	,

		"firstName": "Kirk"
		"lastName": "Douglas"
	,

		"firstName": "Henry"
		"lastName": "Fonda"
	,

		"firstName": "Joan"
		"lastName": "Fontaine"
	,

		"firstName": "Clark"
		"lastName": "Gable"
	,

		"firstName": "Judy"
		"lastName": "Garland"
	,

		"firstName": "John"
		"lastName": "Gielgud"
	,

		"firstName": "Jerry"
		"lastName": "Goldsmith"
	,

		"firstName": "Cary"
		"lastName": "Grant"
	,

		"firstName": "Alec"
		"lastName": "Guinness"
	,

		"firstName": "Rita"
		"lastName": "Hayworth"
	,

		"firstName": "Audrey"
		"lastName": "Hepburn"
	,

		"firstName": "Katharine"
		"lastName": "Hepburn"
	,

		"firstName": "Charlton"
		"lastName": "Heston"
	,

		"firstName": "Alfred"
		"lastName": "Hitchcock"
	,

		"firstName": "William"
		"lastName": "Holden"
	,

		"firstName": "James"
		"lastName": "Horner"
	,

		"firstName": "Buster"
		"lastName": "Keaton"
	,

		"firstName": "Gene"
		"lastName": "Kelly"
	,

		"firstName": "Grace"
		"lastName": "Kelly"
	,

		"firstName": "Stanley"
		"lastName": "Kubrick"
	,

		"firstName": "Akira"
		"lastName": "Kurosawa"
	,

		"firstName": "Alan"
		"lastName": "Ladd"
	,

		"firstName": "Veronica"
		"lastName": "Lake"
	,

		"firstName": "Burt"
		"lastName": "Lancaster"
	,

		"firstName": "Bruce"
		"lastName": "Lee"
	,

		"firstName": "Vivien"
		"lastName": "Leigh"
	,

		"firstName": "Sophia"
		"lastName": "Loren"
	,

		"firstName": "Peter"
		"lastName": "Lorre"
	,

		"firstName": "Groucho"
		"lastName": "Marx"
	,

		"firstName": "James"
		"lastName": "Mason"
	,

		"firstName": "Marcello"
		"lastName": "Mastroianni"
	,

		"firstName": "Robert"
		"lastName": "Mitchum"
	,

		"firstName": "Marilyn"
		"lastName": "Monroe"
	,

		"firstName": "Alfred"
		"lastName": "Newman"
	,

		"firstName": "Paul"
		"lastName": "Newman"
	,

		"firstName": "David"
		"lastName": "Niven"
	,

		"firstName": "Gregory"
		"lastName": "Peck"
	,

		"firstName": "Tyrone"
		"lastName": "Power"
	,

		"firstName": "Anthony"
		"lastName": "Quinn"
	,

		"firstName": "Nino"
		"lastName": "Rota"
	,

		"firstName": "Jane"
		"lastName": "Russell"
	,

		"firstName": "Randolph"
		"lastName": "Scott"
	,

		"firstName": "Max"
		"lastName": "Steiner"
	,

		"firstName": "James"
		"lastName": "Stewart"
	,

		"firstName": "Elizabeth"
		"lastName": "Taylor"
	,

		"firstName": "Shirley"
		"lastName": "Temple"
	,

		"firstName": "Gene"
		"lastName": "Tierney"
	,

		"firstName": "Spencer"
		"lastName": "Tracy"
	,

		"firstName": "Franz"
		"lastName": "Waxman"
	,

		"firstName": "John"
		"lastName": "Wayne"
	,

		"firstName": "Orson"
		"lastName": "Welles"
	,

		"firstName": "Natalie"
		"lastName": "Wood"
	,

		"firstName": "Victor"
		"lastName": "Young"
	,

		"firstName": "Alan"
		"lastName": "Miller"
	,

		"firstName": "Li"
		"lastName": "Gong"
	,

		"firstName": "Henner"
		"lastName": "Hofmann"
	,

		"firstName": "Yelena"
		"lastName": "Koreneva"
	,

		"firstName": "Aleksei"
		"lastName": "Korenev"
	,

		"firstName": "John"
		"lastName": "Cleese"
	,

		"firstName": "Brad"
		"lastName": "Pitt"
	,

		"firstName": "J"
		"lastName": "Reifel"
	,

		"firstName": "Woody"
		"lastName": "Allen"
	,

		"firstName": "Gillian"
		"lastName": "Anderson"
	,

		"firstName": "Pamela"
		"lastName": "Anderson"
	,

		"firstName": "Jennifer"
		"lastName": "Aniston"
	,

		"firstName": "Rowan"
		"lastName": "Atkinson"
	,

		"firstName": "Dan"
		"lastName": "Aykroyd"
	,

		"firstName": "Kevin"
		"lastName": "Bacon"
	,

		"firstName": "Fairuza"
		"lastName": "Balk"
	,

		"firstName": "Antonio"
		"lastName": "Banderas"
	,

		"firstName": "Adrienne"
		"lastName": "Barbeau"
	,

		"firstName": "Drew"
		"lastName": "Barrymore"
	,

		"firstName": "Kim"
		"lastName": "Basinger"
	,

		"firstName": "Luc"
		"lastName": "Besson"
	,

		"firstName": "Kenneth"
		"lastName": "Branagh"
	,

		"firstName": "Matthew"
		"lastName": "Broderick"
	,

		"firstName": "Pierce"
		"lastName": "Brosnan"
	,

		"firstName": "Sandra"
		"lastName": "Bullock"
	,

		"firstName": "Steve"
		"lastName": "Buscemi"
	,

		"firstName": "Nicolas"
		"lastName": "Cage"
	,

		"firstName": "James"
		"lastName": "Cameron"
	,

		"firstName": "Neve"
		"lastName": "Campbell"
	,

		"firstName": "John"
		"lastName": "Carpenter"
	,

		"firstName": "Jim"
		"lastName": "Carrey"
	,

		"firstName": "Phoebe"
		"lastName": "Cates"
	,

		"firstName": "Charles"
		"lastName": "Chaplin"
	,

		"firstName": "George"
		"lastName": "Clooney"
	,

		"firstName": "Jennifer"
		"lastName": "Connelly"
	,

		"firstName": "Sean"
		"lastName": "Connery"
	,

		"firstName": "Kevin"
		"lastName": "Costner"
	,

		"firstName": "Wes"
		"lastName": "Craven"
	,

		"firstName": "Russell"
		"lastName": "Crowe"
	,

		"firstName": "Jamie"
		"lastName": "Lee Curtis"
	,

		"firstName": "John"
		"lastName": "Cusack"
	,

		"firstName": "Claire"
		"lastName": "Danes"
	,

		"firstName": "Geena"
		"lastName": "Davis"
	,

		"firstName": "Robert"
		"lastName": "De Niro"
	,

		"firstName": "John"
		"lastName": "Denver"
	,

		"firstName": "Johnny"
		"lastName": "Depp"
	,

		"firstName": "Bo"
		"lastName": "Derek"
	,

		"firstName": "Leonardo"
		"lastName": "DiCaprio"
	,

		"firstName": "Michael"
		"lastName": "Douglas"
	,

		"firstName": "David"
		"lastName": "Duchovny"
	,

		"firstName": "Clint"
		"lastName": "Eastwood"
	,

		"firstName": "Erika"
		"lastName": "Eleniak"
	,

		"firstName": "Cary"
		"lastName": "Elwes"
	,

		"firstName": "Sherilyn"
		"lastName": "Fenn"
	,

		"firstName": "Ralph"
		"lastName": "Fiennes"
	,

		"firstName": "Colin"
		"lastName": "Firth"
	,

		"firstName": "Harrison"
		"lastName": "Ford"
	,

		"firstName": "Morgan"
		"lastName": "Freeman"
	,

		"firstName": "Richard"
		"lastName": "Gere"
	,

		"firstName": "Gina"
		"lastName": "Gershon"
	,

		"firstName": "Mel"
		"lastName": "Gibson"
	,

		"firstName": "Whoopi"
		"lastName": "Goldberg"
	,

		"firstName": "Jeff"
		"lastName": "Goldblum"
	,

		"firstName": "Linda"
		"lastName": "Hamilton"
	,

		"firstName": "Tom"
		"lastName": "Hanks"
	,

		"firstName": "Ethan"
		"lastName": "Hawke"
	,

		"firstName": "Salma"
		"lastName": "Hayek"
	,

		"firstName": "Anne"
		"lastName": "Heche"
	,

		"firstName": "Dustin"
		"lastName": "Hoffman"
	,

		"firstName": "Anthony"
		"lastName": "Hopkins"
	,

		"firstName": "Ron"
		"lastName": "Howard"
	,

		"firstName": "Helen"
		"lastName": "Hunt"
	,

		"firstName": "Elizabeth"
		"lastName": "Hurley"
	,

		"firstName": "Milla"
		"lastName": "Jovovich"
	,

		"firstName": "Ashley"
		"lastName": "Judd"
	,

		"firstName": "Harvey"
		"lastName": "Keitel"
	,

		"firstName": "Nicole"
		"lastName": "Kidman"
	,

		"firstName": "Val"
		"lastName": "Kilmer"
	,

		"firstName": "Stephen"
		"lastName": "King"
	,

		"firstName": "Nastassja"
		"lastName": "Kinski"
	,

		"firstName": "Kevin"
		"lastName": "Kline"
	,

		"firstName": "Diane"
		"lastName": "Lane"
	,

		"firstName": "David"
		"lastName": "Lean"
	,

		"firstName": "Heather"
		"lastName": "Locklear"
	,

		"firstName": "Jennifer"
		"lastName": "Lopez"
	,

		"firstName": "Traci"
		"lastName": "Lords"
	,

		"firstName": "George"
		"lastName": "Lucas"
	,

		"firstName": "Dolph"
		"lastName": "Lundgren"
	,

		"firstName": "David"
		"lastName": "Lynch"
	,

		"firstName": "Madonn"
		"lastName": ""
	,

		"firstName": "Steve"
		"lastName": "Martin"
	,

		"firstName": "Matthew"
		"lastName": "McConaughey"
	,

		"firstName": "Ewan"
		"lastName": "McGregor"
	,

		"firstName": "Alyssa"
		"lastName": "Milano"
	,

		"firstName": "Demi"
		"lastName": "Moore"
	,

		"firstName": "Julianne"
		"lastName": "Moore"
	,

		"firstName": "Bill"
		"lastName": "Murray"
	,

		"firstName": "Mike"
		"lastName": "Myers"
	,

		"firstName": "Jack"
		"lastName": "Nicholson"
	,

		"firstName": "Gary"
		"lastName": "Oldman"
	,

		"firstName": "Bill"
		"lastName": "Paxton"
	,

		"firstName": "Michelle"
		"lastName": "Pfeiffer"
	,

		"firstName": "Ryan"
		"lastName": "Phillippe"
	,

		"firstName": "River"
		"lastName": "Phoenix"
	,

		"firstName": "Natalie"
		"lastName": "Portman"
	,

		"firstName": "Parker"
		"lastName": "Posey"
	,

		"firstName": "Keanu"
		"lastName": "Reeves"
	,

		"firstName": "Christina"
		"lastName": "Ricci"
	,

		"firstName": "Molly"
		"lastName": "Ringwald"
	,

		"firstName": "Julia"
		"lastName": "Roberts"
	,

		"firstName": "Mimi"
		"lastName": "Rogers"
	,

		"firstName": "Meg"
		"lastName": "Ryan"
	,

		"firstName": "Winona"
		"lastName": "Ryder"
	,

		"firstName": "Mia"
		"lastName": "Sara"
	,

		"firstName": "Susan"
		"lastName": "Sarandon"
	,

		"firstName": "Arnold"
		"lastName": "Schwarzenegger"
	,

		"firstName": "Martin"
		"lastName": "Scorsese"
	,

		"firstName": "Kristin"
		"lastName": "Scott Thomas"
	,

		"firstName": "Joan"
		"lastName": "Severance"
	,

		"firstName": "Charlie"
		"lastName": "Sheen"
	,

		"firstName": "Brooke"
		"lastName": "Shields"
	,

		"firstName": "Elisabeth"
		"lastName": "Shue"
	,

		"firstName": "Alicia"
		"lastName": "Silverstone"
	,

		"firstName": "Christian"
		"lastName": "Slater"
	,

		"firstName": "Will"
		"lastName": "Smith"
	,

		"firstName": "Mira"
		"lastName": "Sorvino"
	,

		"firstName": "Kevin"
		"lastName": "Spacey"
	,

		"firstName": "Sylvester"
		"lastName": "Stallone"
	,

		"firstName": "Oliver"
		"lastName": "Stone"
	,

		"firstName": "Sharon"
		"lastName": "Stone"
	,

		"firstName": "Quentin"
		"lastName": "Tarantino"
	,

		"firstName": "Charlize"
		"lastName": "Theron"
	,

		"firstName": "Uma"
		"lastName": "Thurman"
	,

		"firstName": "Jennifer"
		"lastName": "Tilly"
	,

		"firstName": "John"
		"lastName": "Travolta"
	,

		"firstName": "Shannon"
		"lastName": "Tweed"
	,

		"firstName": "Skeet"
		"lastName": "Ulrich"
	,

		"firstName": "Mark"
		"lastName": "Wahlberg"
	,

		"firstName": "Sigourney"
		"lastName": "Weaver"
	,

		"firstName": "Robin"
		"lastName": "Williams"
	,

		"firstName": "Bruce"
		"lastName": "Willis"
	,

		"firstName": "John"
		"lastName": "Woo"
	,

		"firstName": "Timothy"
		"lastName": "Dowling"
	,

		"firstName": "Robert"
		"lastName": "Ellis"
	,

		"firstName": "Robert"
		"lastName": "Ellis"
	,

		"firstName": "Isabelle"
		"lastName": "Adjani"
	,

		"firstName": "Ben"
		"lastName": "Affleck"
	,

		"firstName": "Jenny"
		"lastName": "Agutter"
	,

		"firstName": "Alan"
		"lastName": "Alda"
	,

		"firstName": "Stephanie"
		"lastName": "Zimbalist"
	,

		"firstName": "Joan"
		"lastName": "Allen"
	,

		"firstName": "Karen"
		"lastName": "Allen"
	,

		"firstName": "Nancy"
		"lastName": "Allen"
	,

		"firstName": "Kirstie"
		"lastName": "Alley"
	,

		"firstName": "Robert"
		"lastName": "Altman"
	,

		"firstName": "Ursula"
		"lastName": "Andress"
	,

		"firstName": "Julie"
		"lastName": "Andrews"
	,

		"firstName": "Gabrielle"
		"lastName": "Anwar"
	,

		"firstName": "Anne"
		"lastName": "Archer"
	,

		"firstName": "Fanny"
		"lastName": "Ardant"
	,

		"firstName": "Alan"
		"lastName": "Arkin"
	,

		"firstName": "David"
		"lastName": "Arquette"
	,

		"firstName": "Rosanna"
		"lastName": "Arquette"
	,

		"firstName": "Sean"
		"lastName": "Astin"
	,

		"firstName": "Richard"
		"lastName": "Attenborough"
	,

		"firstName": "Pernilla"
		"lastName": "August"
	,

		"firstName": "Catherine"
		"lastName": "Bach"
	,

		"firstName": "Scott"
		"lastName": "Baio"
	,

		"firstName": "Scott"
		"lastName": "Bairstow"
	,

		"firstName": "Brenda"
		"lastName": "Bakke"
	,

		"firstName": "Adam"
		"lastName": "Baldwin"
	,

		"firstName": "Alec"
		"lastName": "Baldwin"
	,

		"firstName": "Stephen"
		"lastName": "Baldwin"
	,

		"firstName": "William"
		"lastName": "Baldwin"
	,

		"firstName": "Christian"
		"lastName": "Bale"
	,

		"firstName": "John"
		"lastName": "Barry"
	,

		"firstName": "Angela"
		"lastName": "Bassett"
	,

		"firstName": "Michelle"
		"lastName": "Bauer"
	,

		"firstName": "Sean"
		"lastName": "Bean"
	,

		"firstName": "Amanda"
		"lastName": "Bearse"
	,

		"firstName": "Kate"
		"lastName": "Beckinsale"
	,

		"firstName": "Robert"
		"lastName": "Beltran"
	,

		"firstName": "Tom"
		"lastName": "Berenger"
	,

		"firstName": "Candice"
		"lastName": "Bergen"
	,

		"firstName": "Juliette"
		"lastName": "Binoche"
	,

		"firstName": "Thora"
		"lastName": "Birch"
	,

		"firstName": "Jacqueline"
		"lastName": "Bisset"
	,

		"firstName": "Honor"
		"lastName": "Blackman"
	,

		"firstName": "Linda"
		"lastName": "Blair"
	,

		"firstName": "Mel"
		"lastName": "Blanc"
	,

		"firstName": "Brian"
		"lastName": "Blessed"
	,

		"firstName": "Helena"
		"lastName": "Bonham Carter"
	,

		"firstName": "Ernest"
		"lastName": "Borgnine"
	,

		"firstName": "Bruce"
		"lastName": "Boxleitner"
	,

		"firstName": "Annie"
		"lastName": "Rosar"
	,

		"firstName": "Amy"
		"lastName": "Brenneman"
	,

		"firstName": "Jeff"
		"lastName": "Bridges"
	,

		"firstName": "Charles"
		"lastName": "Bronson"
	,

		"firstName": "Louise"
		"lastName": "Brooks"
	,

		"firstName": "Mel"
		"lastName": "Brooks"
	,

		"firstName": "Clancy"
		"lastName": "Brown"
	,

		"firstName": "Tim"
		"lastName": "Burton"
	,

		"firstName": "Gabriel"
		"lastName": "Byrne"
	,

		"firstName": "Michael"
		"lastName": "Caine"
	,

		"firstName": "Barbara"
		"lastName": "Carrera"
	,

		"firstName": "David"
		"lastName": "Caruso"
	,

		"firstName": "Kim"
		"lastName": "Cattrall"
	,

		"firstName": "Lacey"
		"lastName": "Chabert"
	,

		"firstName": "Richard"
		"lastName": "Chamberlain"
	,

		"firstName": "Stockard"
		"lastName": "Channing"
	,

		"firstName": "Chevy"
		"lastName": "Chase"
	,

		"firstName": "Don"
		"lastName": "Cheadle"
	,

		"firstName": "Che"
		"lastName": ""
	,

		"firstName": "Glenn"
		"lastName": "Close"
	,

		"firstName": "James"
		"lastName": "Coburn"
	,

		"firstName": "Rachael"
		"lastName": "Leigh Cook"
	,

		"firstName": "Francis"
		"lastName": "Ford Coppola"
	,

		"firstName": "Cindy"
		"lastName": "Crawford"
	,

		"firstName": "Michael"
		"lastName": "Crichton"
	,

		"firstName": "James"
		"lastName": "Cromwell"
	,

		"firstName": "David"
		"lastName": "Cronenberg"
	,

		"firstName": "Denise"
		"lastName": "Crosby"
	,

		"firstName": "Billy"
		"lastName": "Crystal"
	,

		"firstName": "Macaulay"
		"lastName": "Culkin"
	,

		"firstName": "Tim"
		"lastName": "Curry"
	,

		"firstName": "Tony"
		"lastName": "Curtis"
	,

		"firstName": "Willem"
		"lastName": "Dafoe"
	,

		"firstName": "Matt"
		"lastName": "Damon"
	,

		"firstName": "Anthony"
		"lastName": "Daniels"
	,

		"firstName": "Sybil"
		"lastName": "Danning"
	,

		"firstName": "Lolita"
		"lastName": "Davidovich"
	,

		"firstName": "Rebecca"
		"lastName": "De Mornay"
	,

		"firstName": "Brian"
		"lastName": "De Palma"
	,

		"firstName": "Danny"
		"lastName": "DeVito"
	,

		"firstName": "Loren"
		"lastName": "Dean"
	,

		"firstName": "Sandra"
		"lastName": "Dee"
	,

		"firstName": "Julie"
		"lastName": "Delpy"
	,

		"firstName": "Catherine"
		"lastName": "Deneuve"
	,

		"firstName": "Laura"
		"lastName": "Dern"
	,

		"firstName": "Walt"
		"lastName": "Disney"
	,

		"firstName": "Ami"
		"lastName": "Dolenz"
	,

		"firstName": "Amanda"
		"lastName": "Donohoe"
	,

		"firstName": "Michael"
		"lastName": "Dorn"
	,

		"firstName": "Brad"
		"lastName": "Dourif"
	,

		"firstName": "Fran"
		"lastName": "Drescher"
	,

		"firstName": "Richard"
		"lastName": "Dreyfuss"
	,

		"firstName": "Minnie"
		"lastName": "Driver"
	,

		"firstName": "Robert"
		"lastName": "Duvall"
	,

		"firstName": "Anthony"
		"lastName": "Edwards"
	,

		"firstName": "Atom"
		"lastName": "Egoyan"
	,

		"firstName": "Jennifer"
		"lastName": "Ehle"
	,

		"firstName": "Danny"
		"lastName": "Elfman"
	,

		"firstName": "Sam"
		"lastName": "Elliott"
	,

		"firstName": "Roland"
		"lastName": "Emmerich"
	,

		"firstName": "Robert"
		"lastName": "Englund"
	,

		"firstName": "Joe"
		"lastName": "Eszterhas"
	,

		"firstName": "Rupert"
		"lastName": "Everett"
	,

		"firstName": "Morgan"
		"lastName": "Fairchild"
	,

		"firstName": "Peter"
		"lastName": "Falk"
	,

		"firstName": "Chris"
		"lastName": "Farley"
	,

		"firstName": "Terry"
		"lastName": "Farrell"
	,

		"firstName": "Farrah"
		"lastName": "Fawcett"
	,

		"firstName": "Corey"
		"lastName": "Feldman"
	,

		"firstName": "Sally"
		"lastName": "Field"
	,

		"firstName": "Linda"
		"lastName": "Fiorentino"
	,

		"firstName": "Laurence"
		"lastName": "Fishburne"
	,

		"firstName": "Carrie"
		"lastName": "Fisher"
	,

		"firstName": "Bridget"
		"lastName": "Fonda"
	,

		"firstName": "Jane"
		"lastName": "Fonda"
	,

		"firstName": "Michelle"
		"lastName": "Forbes"
	,

		"firstName": "John"
		"lastName": "Ford"
	,

		"firstName": "Jonathan"
		"lastName": "Frakes"
	,

		"firstName": "Stephen"
		"lastName": "Fry"
	,

		"firstName": "Edward"
		"lastName": "Furlong"
	,

		"firstName": "Andy"
		"lastName": "Garcia"
	,

		"firstName": "Janeane"
		"lastName": "Garofalo"
	,

		"firstName": "Teri"
		"lastName": "Garr"
	,

		"firstName": "Jami"
		"lastName": "Gertz"
	,

		"firstName": "Terry"
		"lastName": "Gilliam"
	,

		"firstName": "Crispin"
		"lastName": "Glover"
	,

		"firstName": "Danny"
		"lastName": "Glover"
	,

		"firstName": "Valeria"
		"lastName": "Golino"
	,

		"firstName": "John"
		"lastName": "Goodman"
	,

		"firstName": "Serena"
		"lastName": "Grandi"
	,

		"firstName": "Hugh"
		"lastName": "Grant"
	,

		"firstName": "Peter"
		"lastName": "Greenaway"
	,

		"firstName": "Jennifer"
		"lastName": "Grey"
	,

		"firstName": "Pam"
		"lastName": "Grier"
	,

		"firstName": "Steve"
		"lastName": "Guttenberg"
	,

		"firstName": "Taylor"
		"lastName": "Hackford"
	,

		"firstName": "Gene"
		"lastName": "Hackman"
	,

		"firstName": "Corey"
		"lastName": "Haim"
	,

		"firstName": "Mark"
		"lastName": "Hamill"
	,

		"firstName": "Daryl"
		"lastName": "Hannah"
	,

		"firstName": "Curtis"
		"lastName": "Hanson"
	,

		"firstName": "Woody"
		"lastName": "Harrelson"
	,

		"firstName": "Ed"
		"lastName": "Harris"
	,

		"firstName": "Nina"
		"lastName": "Hartley"
	,

		"firstName": "Noah"
		"lastName": "Hathaway"
	,

		"firstName": "Rutger"
		"lastName": "Hauer"
	,

		"firstName": "Goldie"
		"lastName": "Hawn"
	,

		"firstName": "Glenne"
		"lastName": "Headly"
	,

		"firstName": "Dan"
		"lastName": "Hedaya"
	,

		"firstName": "Mariel"
		"lastName": "Hemingway"
	,

		"firstName": "Marilu"
		"lastName": "Henner"
	,

		"firstName": "Lance"
		"lastName": "Henriksen"
	,

		"firstName": "Philip"
		"lastName": "Seymour Hoffman"
	,

		"firstName": "Gaby"
		"lastName": "Hoffmann"
	,

		"firstName": "Lauren"
		"lastName": "Holly"
	,

		"firstName": "Ian"
		"lastName": "Holm"
	,

		"firstName": "Dennis"
		"lastName": "Hopper"
	,

		"firstName": "John"
		"lastName": "Hughes"
	,

		"firstName": "Holly"
		"lastName": "Hunter"
	,

		"firstName": "John"
		"lastName": "Hurt"
	,

		"firstName": "William"
		"lastName": "Hurt"
	,

		"firstName": "Jeremy"
		"lastName": "Irons"
	,

		"firstName": "Michael"
		"lastName": "Ironside"
	,

		"firstName": "Kate"
		"lastName": "Jackson"
	,

		"firstName": "Famke"
		"lastName": "Janssen"
	,

		"firstName": "Jim"
		"lastName": "Jarmusch"
	,

		"firstName": "Ron"
		"lastName": "Jeremy"
	,

		"firstName": "Don"
		"lastName": "Johnson"
	,

		"firstName": "Jeffrey"
		"lastName": "Jones"
	,

		"firstName": "Raul"
		"lastName": "Julia"
	,

		"firstName": "Boris"
		"lastName": "Karloff"
	,

		"firstName": "Diane"
		"lastName": "Keaton"
	,

		"firstName": "Michael"
		"lastName": "Keaton"
	,

		"firstName": "Patsy"
		"lastName": "Kensit"
	,

		"firstName": "Sally"
		"lastName": "Kirkland"
	,

		"firstName": "Mia"
		"lastName": "Kirshner"
	,

		"firstName": "Tawny"
		"lastName": "Kitaen"
	,

		"firstName": "Elias"
		"lastName": "Koteas"
	,

		"firstName": "Alice"
		"lastName": "Krige"
	,

		"firstName": "Sylvia"
		"lastName": "Kristel"
	,

		"firstName": "Christopher"
		"lastName": "Lambert"
	,

		"firstName": "John"
		"lastName": "Landis"
	,

		"firstName": "Fritz"
		"lastName": "Lang"
	,

		"firstName": "Heather"
		"lastName": "Langenkamp"
	,

		"firstName": "Ang"
		"lastName": "Lee"
	,

		"firstName": "Brandon"
		"lastName": "Lee"
	,

		"firstName": "Spike"
		"lastName": "Lee"
	,

		"firstName": "John"
		"lastName": "Leguizamo"
	,

		"firstName": "Jennifer"
		"lastName": "Jason Leigh"
	,

		"firstName": "Jack"
		"lastName": "Lemmon"
	,

		"firstName": "Robert"
		"lastName": "Sean Leonard"
	,

		"firstName": "Juliette"
		"lastName": "Lewis"
	,

		"firstName": "Jennifer"
		"lastName": "Lien"
	,

		"firstName": "Matthew"
		"lastName": "Lillard"
	,

		"firstName": "Richard"
		"lastName": "Linklater"
	,

		"firstName": "Ray"
		"lastName": "Liotta"
	,

		"firstName": "Christopher"
		"lastName": "Lloyd"
	,

		"firstName": "Emily"
		"lastName": "Lloyd"
	,

		"firstName": "Amy"
		"lastName": "Locane"
	,

		"firstName": "Nia"
		"lastName": "Long"
	,

		"firstName": "Rob"
		"lastName": "Lowe"
	,

		"firstName": "Carey"
		"lastName": "Lowell"
	,

		"firstName": "Andie"
		"lastName": "MacDowell"
	,

		"firstName": "Shirley"
		"lastName": "MacLaine"
	,

		"firstName": "Elle"
		"lastName": "Macpherson"
	,

		"firstName": "Michael"
		"lastName": "Madsen"
	,

		"firstName": "Virginia"
		"lastName": "Madsen"
	,

		"firstName": "Lee"
		"lastName": "Majors"
	,

		"firstName": "Terrence"
		"lastName": "Malick"
	,

		"firstName": "John"
		"lastName": "Malkovich"
	,

		"firstName": "Michael"
		"lastName": "Mann"
	,

		"firstName": "Sophie"
		"lastName": "Marceau"
	,

		"firstName": "Vanessa"
		"lastName": "Marcil"
	,

		"firstName": "Julianna"
		"lastName": "Margulies"
	,

		"firstName": "Mary"
		"lastName": "Stuart Masterson"
	,

		"firstName": "Heather"
		"lastName": "Matarazzo"
	,

		"firstName": "Samantha"
		"lastName": "Mathis"
	,

		"firstName": "Walter"
		"lastName": "Matthau"
	,

		"firstName": "Mathilda"
		"lastName": "May"
	,

		"firstName": "Andrew"
		"lastName": "McCarthy"
	,

		"firstName": "Frances"
		"lastName": "McDormand"
	,

		"firstName": "Malcolm"
		"lastName": "McDowell"
	,

		"firstName": "Gates"
		"lastName": "McFadden"
	,

		"firstName": "Kelly"
		"lastName": "McGillis"
	,

		"firstName": "Rose"
		"lastName": "McGowan"
	,

		"firstName": "Robert"
		"lastName": "Duncan McNeill"
	,

		"firstName": "Steve"
		"lastName": "McQueen"
	,

		"firstName": "Colm"
		"lastName": "Meaney"
	,

		"firstName": "Russ"
		"lastName": "Meyer"
	,

		"firstName": "Bette"
		"lastName": "Midler"
	,

		"firstName": "Penelope"
		"lastName": "Ann Miller"
	,

		"firstName": "Sal"
		"lastName": "Mineo"
	,

		"firstName": "Carmen"
		"lastName": "Miranda"
	,

		"firstName": "Helen"
		"lastName": "Mirren"
	,

		"firstName": "Matthew"
		"lastName": "Modine"
	,

		"firstName": "Alfred"
		"lastName": "Molina"
	,

		"firstName": "Elizabeth"
		"lastName": "Montgomery"
	,

		"firstName": "Kate"
		"lastName": "Mulgrew"
	,

		"firstName": "Dermot"
		"lastName": "Mulroney"
	,

		"firstName": "Eddie"
		"lastName": "Murphy"
	,

		"firstName": "Liam"
		"lastName": "Neeson"
	,

		"firstName": "Sam"
		"lastName": "Neill"
	,

		"firstName": "Judd"
		"lastName": "Nelson"
	,

		"firstName": "Brigitte"
		"lastName": "Nielsen"
	,

		"firstName": "Leslie"
		"lastName": "Nielsen"
	,

		"firstName": "Nick"
		"lastName": "Nolte"
	,

		"firstName": "Peter"
		"lastName": "North"
	,

		"firstName": "Jeremy"
		"lastName": "Northam"
	,

		"firstName": "Lena"
		"lastName": "Olin"
	,

		"firstName": "Julia"
		"lastName": "Ormond"
	,

		"firstName": "George"
		"lastName": "Orwell"
	,

		"firstName": "Frank"
		"lastName": "Oz"
	,

		"firstName": "Alan"
		"lastName": "Parker"
	,

		"firstName": "Sarah"
		"lastName": "Jessica Parker"
	,

		"firstName": "Dolly"
		"lastName": "Parton"
	,

		"firstName": "Jason"
		"lastName": "Patric"
	,

		"firstName": "Alexandra"
		"lastName": "Paul"
	,

		"firstName": "Sean"
		"lastName": "Penn"
	,

		"firstName": "George"
		"lastName": "Peppard"
	,

		"firstName": "Anthony"
		"lastName": "Perkins"
	,

		"firstName": "Luke"
		"lastName": "Perry"
	,

		"firstName": "Joe"
		"lastName": "Pesci"
	,

		"firstName": "Wolfgang"
		"lastName": "Petersen"
	,

		"firstName": "Amanda"
		"lastName": "Peterson"
	,

		"firstName": "Robert"
		"lastName": "Picardo"
	,

		"firstName": "Jada"
		"lastName": "Pinkett Smith"
	,

		"firstName": "Donald"
		"lastName": "Pleasence"
	,

		"firstName": "Martha"
		"lastName": "Plimpton"
	,

		"firstName": "Edgar"
		"lastName": "Allan Poe"
	,

		"firstName": "Roman"
		"lastName": "Polanski"
	,

		"firstName": "Pete"
		"lastName": "Postlethwaite"
	,

		"firstName": "Kelly"
		"lastName": "Preston"
	,

		"firstName": "Jason"
		"lastName": "Priestley"
	,

		"firstName": "Victoria"
		"lastName": "Principal"
	,

		"firstName": "Jonathan"
		"lastName": "Pryce"
	,

		"firstName": "Bill"
		"lastName": "Pullman"
	,

		"firstName": "Dennis"
		"lastName": "Quaid"
	,

		"firstName": "Sam"
		"lastName": "Raimi"
	,

		"firstName": "Harold"
		"lastName": "Ramis"
	,

		"firstName": "Robert"
		"lastName": "Redford"
	,

		"firstName": "Vanessa"
		"lastName": "Redgrave"
	,

		"firstName": "Brad"
		"lastName": "Renfro"
	,

		"firstName": "Jean"
		"lastName": "Reno"
	,

		"firstName": "Paul"
		"lastName": "Reubens"
	,

		"firstName": "Burt"
		"lastName": "Reynolds"
	,

		"firstName": "Giovanni"
		"lastName": "Ribisi"
	,

		"firstName": "Ariana"
		"lastName": "Richards"
	,

		"firstName": "Denise"
		"lastName": "Richards"
	,

		"firstName": "Joely"
		"lastName": "Richardson"
	,

		"firstName": "Alan"
		"lastName": "Rickman"
	,

		"firstName": "John"
		"lastName": "Ritter"
	,

		"firstName": "Eric"
		"lastName": "Roberts"
	,

		"firstName": "Tanya"
		"lastName": "Roberts"
	,

		"firstName": "Isabella"
		"lastName": "Rossellini"
	,

		"firstName": "Mickey"
		"lastName": "Rourke"
	,

		"firstName": "Kurt"
		"lastName": "Russell"
	,

		"firstName": "Theresa"
		"lastName": "Russell"
	,

		"firstName": "Rene"
		"lastName": "Russo"
	,

		"firstName": "Laura"
		"lastName": "San Giacomo"
	,

		"firstName": "Fred"
		"lastName": "Savage"
	,

		"firstName": "John"
		"lastName": "Sayles"
	,

		"firstName": "Greta"
		"lastName": "Scacchi"
	,

		"firstName": "Johnathon"
		"lastName": "Schaech"
	,

		"firstName": "Liev"
		"lastName": "Schreiber"
	,

		"firstName": "Ridley"
		"lastName": "Scott"
	,

		"firstName": "Jerry"
		"lastName": "Seinfeld"
	,

		"firstName": "Tom"
		"lastName": "Selleck"
	,

		"firstName": "Peter"
		"lastName": "Sellers"
	,

		"firstName": "Yahoo"
		"lastName": "Serious"
	,

		"firstName": "William"
		"lastName": "Shakespeare"
	,

		"firstName": "Tupac"
		"lastName": "Shakur"
	,

		"firstName": "William"
		"lastName": "Shatner"
	,

		"firstName": "Martin"
		"lastName": "Sheen"
	,

		"firstName": "Gary"
		"lastName": "Sinise"
	,

		"firstName": "Marina"
		"lastName": "Sirtis"
	,

		"firstName": "Tom"
		"lastName": "Skerritt"
	,

		"firstName": "Helen"
		"lastName": "Slater"
	,

		"firstName": "Anna"
		"lastName": "Nicole Smith"
	,

		"firstName": "Jaclyn"
		"lastName": "Smith"
	,

		"firstName": "Alan"
		"lastName": "Smithee"
	,

		"firstName": "Wesley"
		"lastName": "Snipes"
	,

		"firstName": "Talisa"
		"lastName": "Soto"
	,

		"firstName": "Sissy"
		"lastName": "Spacek"
	,

		"firstName": "James"
		"lastName": "Spader"
	,

		"firstName": "Brent"
		"lastName": "Spiner"
	,

		"firstName": "Terence"
		"lastName": "Stamp"
	,

		"firstName": "Eric"
		"lastName": "Stoltz"
	,

		"firstName": "Madeleine"
		"lastName": "Stowe"
	,

		"firstName": "David"
		"lastName": "Strathairn"
	,

		"firstName": "Meryl"
		"lastName": "Streep"
	,

		"firstName": "Tami"
		"lastName": "Stronach"
	,

		"firstName": "Donald"
		"lastName": "Sutherland"
	,

		"firstName": "Kiefer"
		"lastName": "Sutherland"
	,

		"firstName": "Dominique"
		"lastName": "Swain"
	,

		"firstName": "Patrick"
		"lastName": "Swayze"
	,

		"firstName": "Lili"
		"lastName": "Taylor"
	,

		"firstName": "David"
		"lastName": "Thewlis"
	,

		"firstName": "Emma"
		"lastName": "Thompson"
	,

		"firstName": "Lea"
		"lastName": "Thompson"
	,

		"firstName": "Billy"
		"lastName": "Bob Thornton"
	,

		"firstName": "Meg"
		"lastName": "Tilly"
	,

		"firstName": "Marisa"
		"lastName": "Tomei"
	,

		"firstName": "Tamlyn"
		"lastName": "Tomita"
	,

		"firstName": "Jeanne"
		"lastName": "Tripplehorn"
	,

		"firstName": "Chris"
		"lastName": "Tucker"
	,

		"firstName": "Robin"
		"lastName": "Tunney"
	,

		"firstName": "Kathleen"
		"lastName": "Turner"
	,

		"firstName": "Casper"
		"lastName": "Van Dien"
	,

		"firstName": "Vince"
		"lastName": "Vaughn"
	,

		"firstName": "Paul"
		"lastName": "Verhoeven"
	,

		"firstName": "Gore"
		"lastName": "Vidal"
	,

		"firstName": "Nana"
		"lastName": "Visitor"
	,

		"firstName": "Jon"
		"lastName": "Voight"
	,

		"firstName": "Christopher"
		"lastName": "Walken"
	,

		"firstName": "Sela"
		"lastName": "Ward"
	,

		"firstName": "Lesley"
		"lastName": "Ann Warren"
	,

		"firstName": "John"
		"lastName": "Waters"
	,

		"firstName": "Teri"
		"lastName": "Weigel"
	,

		"firstName": "Peter"
		"lastName": "Weller"
	,

		"firstName": "Wim"
		"lastName": "Wenders"
	,

		"firstName": "Joanne"
		"lastName": "Whalley"
	,

		"firstName": "Wil"
		"lastName": "Wheaton"
	,

		"firstName": "Billy"
		"lastName": "Wilder"
	,

		"firstName": "Gene"
		"lastName": "Wilder"
	,

		"firstName": "Debra"
		"lastName": "Winger"
	,

		"firstName": "Kate"
		"lastName": "Winslet"
	,

		"firstName": "Reese"
		"lastName": "Witherspoon"
	,

		"firstName": "BD"
		"lastName": "Wong"
	,

		"firstName": "Elijah"
		"lastName": "Wood"
	,

		"firstName": "Robin"
		"lastName": "Wright"
	,

		"firstName": "Michelle"
		"lastName": "Yeoh"
	,

		"firstName": "Sean"
		"lastName": "Young"
	,

		"firstName": "Billy"
		"lastName": "Zane"
	,

		"firstName": "David"
		"lastName": "Raksin"
	,

		"firstName": "Rick"
		"lastName": "Baker"
	,

		"firstName": "Steve"
		"lastName": "Cohen"
	,

		"firstName": "Joel"
		"lastName": "Oliansky"
	,

		"firstName": "Willie"
		"lastName": "Aames"
	,

		"firstName": "Caroline"
		"lastName": "Aaron"
	,

		"firstName": "Paula"
		"lastName": "Abdul"
	,

		"firstName": "Ian"
		"lastName": "Abercrombie"
	,

		"firstName": "Jim"
		"lastName": "Abrahams"
	,

		"firstName": "Victoria"
		"lastName": "Abril"
	,

		"firstName": "Joss"
		"lastName": "Ackland"
	,

		"firstName": "Deborah"
		"lastName": "Adair"
	,

		"firstName": "Brooke"
		"lastName": "Adams"
	,

		"firstName": "Joey"
		"lastName": "Lauren Adams"
	,

		"firstName": "Maud"
		"lastName": "Adams"
	,

		"firstName": "Percy"
		"lastName": "Adlon"
	,

		"firstName": "Mario"
		"lastName": "Adorf"
	,

		"firstName": "John"
		"lastName": "Agar"
	,

		"firstName": "Brian"
		"lastName": "Aherne"
	,

		"firstName": "Danny"
		"lastName": "Aiello"
	,

		"firstName": "Eddie"
		"lastName": "Albert"
	,

		"firstName": "Brian"
		"lastName": "Aldiss"
	,

		"firstName": "Robert"
		"lastName": "Aldrich"
	,

		"firstName": "Jane"
		"lastName": "Alexander"
	,

		"firstName": "Muhammad"
		"lastName": "Ali"
	,

		"firstName": "Irwin"
		"lastName": "Allen"
	,

		"firstName": "Tim"
		"lastName": "Allen"
	,

		"firstName": "June"
		"lastName": "Allyson"
	,

		"firstName": "Maria"
		"lastName": "Conchita Alonso"
	,

		"firstName": "Carol"
		"lastName": "Alt"
	,

		"firstName": "Trini"
		"lastName": "Alvarado"
	,

		"firstName": "Don"
		"lastName": "Ameche"
	,

		"firstName": "Leon"
		"lastName": "Ames"
	,

		"firstName": "Jon"
		"lastName": "Amiel"
	,

		"firstName": "Suzy"
		"lastName": "Amis"
	,

		"firstName": "Judith"
		"lastName": "Anderson"
	,

		"firstName": "Juliet"
		"lastName": "Anderson"
	,

		"firstName": "Kevin"
		"lastName": "Anderson"
	,

		"firstName": "Lindsay"
		"lastName": "Anderson"
	,

		"firstName": "Loni"
		"lastName": "Anderson"
	,

		"firstName": "Melissa"
		"lastName": "Sue Anderson"
	,

		"firstName": "Melody"
		"lastName": "Anderson"
	,

		"firstName": "Richard"
		"lastName": "Dean Anderson"
	,

		"firstName": "Bibi"
		"lastName": "Andersson"
	,

		"firstName": "Anthony"
		"lastName": "Andrews"
	,

		"firstName": "Dana"
		"lastName": "Andrews"
	,

		"firstName": "Pier"
		"lastName": "Angeli"
	,

		"firstName": "Theodoros"
		"lastName": "Angelopoulos"
	,

		"firstName": "Francesca"
		"lastName": "Annis"
	,

		"firstName": "David"
		"lastName": "Anspaugh"
	,

		"firstName": "Lysette"
		"lastName": "Anthony"
	,

		"firstName": "Susan"
		"lastName": "Anton"
	,

		"firstName": "Laura"
		"lastName": "Antonelli"
	,

		"firstName": "Michelangelo"
		"lastName": "Antonioni"
	,

		"firstName": "Christina"
		"lastName": "Applegate"
	,

		"firstName": "Michael"
		"lastName": "Apted"
	,

		"firstName": "Gregg"
		"lastName": "Araki"
	,

		"firstName": "Alfonso"
		"lastName": "Arau"
	,

		"firstName": "Denys"
		"lastName": "Arcand"
	,

		"firstName": "Eve"
		"lastName": "Arden"
	,

		"firstName": "Asia"
		"lastName": "Argento"
	,

		"firstName": "Dario"
		"lastName": "Argento"
	,

		"firstName": "Alison"
		"lastName": "Armitage"
	,

		"firstName": "George"
		"lastName": "Armitage"
	,

		"firstName": "Bess"
		"lastName": "Armstrong"
	,

		"firstName": "Gillian"
		"lastName": "Armstrong"
	,

		"firstName": "James"
		"lastName": "Arness"
	,

		"firstName": "Jack"
		"lastName": "Arnold"
	,

		"firstName": "Tom"
		"lastName": "Arnold"
	,

		"firstName": "Alexis"
		"lastName": "Arquette"
	,

		"firstName": "Lewis"
		"lastName": "Arquette"
	,

		"firstName": "Jean"
		"lastName": "Arthur"
	,

		"firstName": "Dana"
		"lastName": "Ashbrook"
	,

		"firstName": "Hal"
		"lastName": "Ashby"
	,

		"firstName": "Linden"
		"lastName": "Ashby"
	,

		"firstName": "Armand"
		"lastName": "Assante"
	,

		"firstName": "Olivier"
		"lastName": "Assayas"
	,

		"firstName": "Mary"
		"lastName": "Astor"
	,

		"firstName": "Christopher"
		"lastName": "Atkins"
	,

		"firstName": "Claudine"
		"lastName": "Auger"
	,

		"firstName": "Bille"
		"lastName": "August"
	,

		"firstName": "Jane"
		"lastName": "Austen"
	,

		"firstName": "Paul"
		"lastName": "Auster"
	,

		"firstName": "Gene"
		"lastName": "Autry"
	,

		"firstName": "Frankie"
		"lastName": "Avalon"
	,

		"firstName": "Roger"
		"lastName": "Avary"
	,

		"firstName": "Tex"
		"lastName": "Avery"
	,

		"firstName": "Mili"
		"lastName": "Avital"
	,

		"firstName": "Jon"
		"lastName": "Avnet"
	,

		"firstName": "Lew"
		"lastName": "Ayres"
	,

		"firstName": "Shabana"
		"lastName": "Azmi"
	,

		"firstName": "Burt"
		"lastName": "Bacharach"
	,

		"firstName": "Amitabh"
		"lastName": "Bachchan"
	,

		"firstName": "Jim"
		"lastName": "Backus"
	,

		"firstName": "Angelo"
		"lastName": "Badalamenti"
	,

		"firstName": "John"
		"lastName": "Badham"
	,

		"firstName": "Mary"
		"lastName": "Badham"
	,

		"firstName": "Jane"
		"lastName": "Badler"
	,

		"firstName": "Maxine"
		"lastName": "Bahns"
	,

		"firstName": "Barbara"
		"lastName": "Bain"
	,

		"firstName": "Oksana"
		"lastName": "Baiul"
	,

		"firstName": "Diane"
		"lastName": "Baker"
	,

		"firstName": "Joe"
		"lastName": "Don Baker"
	,

		"firstName": "Kathy"
		"lastName": "Baker"
	,

		"firstName": "Ralph"
		"lastName": "Bakshi"
	,

		"firstName": "Scott"
		"lastName": "Bakula"
	,

		"firstName": "Bob"
		"lastName": "Balaban"
	,

		"firstName": "Daniel"
		"lastName": "Baldwin"
	,

		"firstName": "Lucille"
		"lastName": "Ball"
	,

		"firstName": "Michael"
		"lastName": "Ballhaus"
	,

		"firstName": "Martin"
		"lastName": "Balsam"
	,

		"firstName": "Anne"
		"lastName": "Bancroft"
	,

		"firstName": "Tamasaburo"
		"lastName": "Bando"
	,

		"firstName": "Tallulah"
		"lastName": "Bankhead"
	,

		"firstName": "Ian"
		"lastName": "Bannen"
	,

		"firstName": "Theda"
		"lastName": "Bara"
	,

		"firstName": "Olivia"
		"lastName": "Barash"
	,

		"firstName": "Clive"
		"lastName": "Barker"
	,

		"firstName": "Lex"
		"lastName": "Barker"
	,

		"firstName": "Bruno"
		"lastName": "Barreto"
	,

		"firstName": "Majel"
		"lastName": "Barrett"
	,

		"firstName": "Ethel"
		"lastName": "Barrymore"
	,

		"firstName": "John"
		"lastName": "Drew Barrymore"
	,

		"firstName": "John"
		"lastName": "Barrymore"
	,

		"firstName": "Paul"
		"lastName": "Bartel"
	,

		"firstName": "Freddie"
		"lastName": "Bartholomew"
	,

		"firstName": "Robin"
		"lastName": "Bartlett"
	,

		"firstName": "Billy"
		"lastName": "Barty"
	,

		"firstName": "Mikhail"
		"lastName": "Baryshnikov"
	,

		"firstName": "Richard"
		"lastName": "Basehart"
	,

		"firstName": "Saul"
		"lastName": "Bass"
	,

		"firstName": "Jason"
		"lastName": "Bateman"
	,

		"firstName": "Justine"
		"lastName": "Bateman"
	,

		"firstName": "Kathy"
		"lastName": "Bates"
	,

		"firstName": "Randall"
		"lastName": "Batinkoff"
	,

		"firstName": "Patrick"
		"lastName": "Bauchau"
	,

		"firstName": "Belinda"
		"lastName": "Bauer"
	,

		"firstName": "Steven"
		"lastName": "Bauer"
	,

		"firstName": "Noah"
		"lastName": "Baumbach"
	,

		"firstName": "Lamberto"
		"lastName": "Bava"
	,

		"firstName": "Mario"
		"lastName": "Bava"
	,

		"firstName": "Meredith"
		"lastName": "Baxter"
	,

		"firstName": "Michael"
		"lastName": "Bay"
	,

		"firstName": "Nathalie"
		"lastName": "Baye"
	,

		"firstName": "Stephanie"
		"lastName": "Beacham"
	,

		"firstName": "Jennifer"
		"lastName": "Beals"
	,

		"firstName": "Ned"
		"lastName": "Beatty"
	,

		"firstName": "Warren"
		"lastName": "Beatty"
	,

		"firstName": "Harold"
		"lastName": "Becker"
	,

		"firstName": "Meret"
		"lastName": "Becker"
	,

		"firstName": "Wallace"
		"lastName": "Beery"
	,

		"firstName": "Jason"
		"lastName": "Beghe"
	,

		"firstName": "Barbara"
		"lastName": "Bel Geddes"
	,

		"firstName": "Harry"
		"lastName": "Belafonte"
	,

		"firstName": "Ralph"
		"lastName": "Bellamy"
	,

		"firstName": "Kathleen"
		"lastName": "Beller"
	,

		"firstName": "Pamela"
		"lastName": "Bellwood"
	,

		"firstName": "James"
		"lastName": "Belushi"
	,

		"firstName": "Brian"
		"lastName": "Benben"
	,

		"firstName": "William"
		"lastName": "Bendix"
	,

		"firstName": "Roberto"
		"lastName": "Benigni"
	,

		"firstName": "Annette"
		"lastName": "Bening"
	,

		"firstName": "Richard"
		"lastName": "Benjamin"
	,

		"firstName": "David"
		"lastName": "Bennent"
	,

		"firstName": "Joan"
		"lastName": "Bennett"
	,

		"firstName": "Nigel"
		"lastName": "Bennett"
	,

		"firstName": "Jack"
		"lastName": "Benny"
	,

		"firstName": "Robby"
		"lastName": "Benson"
	,

		"firstName": "Robert"
		"lastName": "Benton"
	,

		"firstName": "Bruce"
		"lastName": "Beresford"
	,

		"firstName": "Peter"
		"lastName": "Berg"
	,

		"firstName": "Polly"
		"lastName": "Bergen"
	,

		"firstName": "Helmut"
		"lastName": "Berger"
	,

		"firstName": "Patrick"
		"lastName": "Bergin"
	,

		"firstName": "Andrew"
		"lastName": "Bergman"
	,

		"firstName": "Sandahl"
		"lastName": "Bergman"
	,

		"firstName": "Busby"
		"lastName": "Berkeley"
	,

		"firstName": "Elizabeth"
		"lastName": "Berkley"
	,

		"firstName": "Steven"
		"lastName": "Berkoff"
	,

		"firstName": "Milton"
		"lastName": "Berle"
	,

		"firstName": "Irving"
		"lastName": "Berlin"
	,

		"firstName": "Sandra"
		"lastName": "Bernhard"
	,

		"firstName": "Elmer"
		"lastName": "Bernstein"
	,

		"firstName": "Elizabeth"
		"lastName": "Berridge"
	,

		"firstName": "Halle"
		"lastName": "Berry"
	,

		"firstName": "Valerie"
		"lastName": "Bertinelli"
	,

		"firstName": "Bernardo"
		"lastName": "Bertolucci"
	,

		"firstName": "Bibi"
		"lastName": "Besch"
	,

		"firstName": "Martine"
		"lastName": "Beswick"
	,

		"firstName": "Richard"
		"lastName": "Beymer"
	,

		"firstName": "Daniela"
		"lastName": "Bianchi"
	,

		"firstName": "Bigas"
		"lastName": "Luna"
	,

		"firstName": "Kathryn"
		"lastName": "Bigelow"
	,

		"firstName": "Theodore"
		"lastName": "Bikel"
	,

		"firstName": "Traci"
		"lastName": "Bingham"
	,

		"firstName": "Antonia"
		"lastName": "Bird"
	,

		"firstName": "Jane"
		"lastName": "Birkin"
	,

		"firstName": "Whit"
		"lastName": "Bissell"
	,

		"firstName": "Karen"
		"lastName": "Black"
	,

		"firstName": "Shane"
		"lastName": "Black"
	,

		"firstName": "Brenda"
		"lastName": "Blethyn"
	,

		"firstName": "Joan"
		"lastName": "Blondell"
	,

		"firstName": "Hart"
		"lastName": "Bochner"
	,

		"firstName": "Peter"
		"lastName": "Bogdanovich"
	,

		"firstName": "Jon"
		"lastName": "Bon Jovi"
	,

		"firstName": "Ward"
		"lastName": "Bond"
	,

		"firstName": "Lisa"
		"lastName": "Bonet"
	,

		"firstName": "Jan"
		"lastName": "de Bont"
	,

		"firstName": "John"
		"lastName": "Boorman"
	,

		"firstName": "Barry"
		"lastName": "Bostwick"
	,

		"firstName": "Timothy"
		"lastName": "Bottoms"
	,

		"firstName": "Carole"
		"lastName": "Bouquet"
	,

		"firstName": "Stephen"
		"lastName": "Boyd"
	,

		"firstName": "Charles"
		"lastName": "Boyer"
	,

		"firstName": "Danny"
		"lastName": "Boyle"
	,

		"firstName": "Lorraine"
		"lastName": "Bracco"
	,

		"firstName": "Eric"
		"lastName": "Braeden"
	,

		"firstName": "Sonia"
		"lastName": "Braga"
	,

		"firstName": "Jonathan"
		"lastName": "Brandis"
	,

		"firstName": "Nicoletta"
		"lastName": "Braschi"
	,

		"firstName": "Tinto"
		"lastName": "Brass"
	,

		"firstName": "Benjamin"
		"lastName": "Bratt"
	,

		"firstName": "Walter"
		"lastName": "Brennan"
	,

		"firstName": "Robert"
		"lastName": "Bresson"
	,

		"firstName": "Martin"
		"lastName": "Brest"
	,

		"firstName": "Beau"
		"lastName": "Bridges"
	,

		"firstName": "Lloyd"
		"lastName": "Bridges"
	,

		"firstName": "Jim"
		"lastName": "Broadbent"
	,

		"firstName": "James"
		"lastName": "Brolin"
	,

		"firstName": "Josh"
		"lastName": "Brolin"
	,

		"firstName": "Albert"
		"lastName": "Brooks"
	,

		"firstName": "Avery"
		"lastName": "Brooks"
	,

		"firstName": "Bryan"
		"lastName": "Brown"
	,

		"firstName": "Jim"
		"lastName": "Brown"
	,

		"firstName": "Jerry"
		"lastName": "Bruckheimer"
	,

		"firstName": "Betty"
		"lastName": "Buckley"
	,

		"firstName": "Billie"
		"lastName": "Burke"
	,

		"firstName": "Carol"
		"lastName": "Burnett"
	,

		"firstName": "Raymond"
		"lastName": "Burr"
	,

		"firstName": "Ellen"
		"lastName": "Burstyn"
	,

		"firstName": "LeVar"
		"lastName": "Burton"
	,

		"firstName": "Gary"
		"lastName": "Busey"
	,

		"firstName": "Jake"
		"lastName": "Busey"
	,

		"firstName": "Tom"
		"lastName": "Byron"
	]

	getUrl = ->
		"http://localhost:#{port}"

	isUniqueName = (name) ->
		(name for person in people when person.name is name).length is 0

	open = (command = 'open') ->
		url = getUrl()
		ostype = require('os').type()
		command = 'explorer' if ostype is 'Windows_NT'
		spawn = require('child_process').spawn

		console.log "launching #{url}"

		spawn command, [url]

	app = express.createServer()

	app.configure ->
		app.set 'view options',
			layout: false

		app.use express.bodyParser()
		app.use express.static(dir)
		app.use app.router

		app.engine '.html', (str, options) ->
			(locals) ->
				str

		app.get '/', (req, res) ->
			res.render "#{dir}/index.html"

		app.get '/people', (req, res) ->
			res.json people

		app.get '/people/details/:id', (req, res) ->
			id = req.params.id
			current = person for person in people when parseInt(person.id, 10) is parseInt(id, 10)

			res.json current

		app.post '/people', (req, res) ->
			name = req.body.name

			message =
				"title": "Duplicate!"
				"message": "#{name} is a duplicate.  Please enter a new name."

			return res.send(message, 403) if not isUniqueName name

			person =
				"id": "#{nextId++}"
				"name": "#{name}"
				"age": "0"

			people.push person
			res.json person

			#res.header('Authenticated', 'NOPE')
			#res.send 'Conflictola', 401

		app.get '/actors', (req, res) ->
			res.json actors

		app.listen port, ->
			console.log "open your browser to the url below"
			console.log getUrl()
			#open()
)(require('express'), __dirname, process.argv.splice(2)[0])