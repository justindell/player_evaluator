require 'sequel'

DB = Sequel.sqlite('players.sqlite')
teams = DB[:teams]
teams.update(:seed => nil)

teams.filter(:name =>  "Louisville Cardinals"              ).update(:seed => 1)
teams.filter(:name =>  "Kansas Jayhawks"                   ).update(:seed => 1)
teams.filter(:name =>  "Indiana Hoosiers"                  ).update(:seed => 1)
teams.filter(:name =>  "Gonzaga Bulldogs"                  ).update(:seed => 1)

teams.filter(:name =>  "Duke Blue Devils"                  ).update(:seed => 2)
teams.filter(:name =>  "Georgetown Hoyas"                  ).update(:seed => 2)
teams.filter(:name =>  "Miami (FL) Hurricanes"             ).update(:seed => 2)
teams.filter(:name =>  "Ohio State Buckeyes"               ).update(:seed => 2)

teams.filter(:name =>  "Michigan State Spartans"           ).update(:seed => 3)
teams.filter(:name =>  "Florida Gators"                    ).update(:seed => 3)
teams.filter(:name =>  "Marquette Golden Eagles"           ).update(:seed => 3)
teams.filter(:name =>  "New Mexico Lobos"                  ).update(:seed => 3)

teams.filter(:name =>  "Saint Louis Billikens"             ).update(:seed => 4)
teams.filter(:name =>  "Michigan Wolverines"               ).update(:seed => 4)
teams.filter(:name =>  "Syracuse Orange"                   ).update(:seed => 4)
teams.filter(:name =>  "Kansas State Wildcats"             ).update(:seed => 4)

teams.filter(:name =>  "Oklahoma State Cowboys"            ).update(:seed => 5)
teams.filter(:name =>  "Virginia Commonwealth Rams"        ).update(:seed => 5)
teams.filter(:name =>  "Nevada-Las Vegas Rebels"           ).update(:seed => 5)
teams.filter(:name =>  "Wisconsin Badgers"                 ).update(:seed => 5)

teams.filter(:name =>  "Memphis Tigers"                    ).update(:seed => 6)
teams.filter(:name =>  "UCLA Bruins"                       ).update(:seed => 6)
teams.filter(:name =>  "Butler Bulldogs"                   ).update(:seed => 6)
teams.filter(:name =>  "Arizona Wildcats"                  ).update(:seed => 6)

teams.filter(:name =>  "Creighton Bluejays"                ).update(:seed => 7)
teams.filter(:name =>  "San Diego State Aztecs"            ).update(:seed => 7)
teams.filter(:name =>  "Illinois Fighting Illini"          ).update(:seed => 7)
teams.filter(:name =>  "Notre Dame Fighting Irish"         ).update(:seed => 7)

teams.filter(:name =>  "Colorado State Rams"               ).update(:seed => 8)
teams.filter(:name =>  "North Carolina Tar Heels"          ).update(:seed => 8)
teams.filter(:name =>  "North Carolina State Wolfpack"     ).update(:seed => 8)
teams.filter(:name =>  "Pittsburg Panthers"                ).update(:seed => 8)

teams.filter(:name =>  "Missouri Tigers"                   ).update(:seed => 9)
teams.filter(:name =>  "Villanova Wildcats"                ).update(:seed => 9)
teams.filter(:name =>  "Temple Owls"                       ).update(:seed => 9)
teams.filter(:name =>  "Wichita State Shockers"            ).update(:seed => 9)

teams.filter(:name =>  "Cincinnati Bearcats"               ).update(:seed => 10)
teams.filter(:name =>  "Oklahoma Sooners"                  ).update(:seed => 10)
teams.filter(:name =>  "Colorado Buffaloes"                ).update(:seed => 10)
teams.filter(:name =>  "Iowa State Cyclones"               ).update(:seed => 10)

teams.filter(:name =>  "Saint Mary's (CA) Gaels"           ).update(:seed => 11)
teams.filter(:name =>  "Middle Tennessee Blue Raiders"     ).update(:seed => 11)
teams.filter(:name =>  "Minnesota Golden Gophers"          ).update(:seed => 11)
teams.filter(:name =>  "Belmont Bruins"                    ).update(:seed => 11)

teams.filter(:name =>  "Oregon Ducks"                      ).update(:seed => 12)
teams.filter(:name =>  "Akron Zips"                        ).update(:seed => 12)
teams.filter(:name =>  "California Golden Bears"           ).update(:seed => 12)
teams.filter(:name =>  "Mississippi Rebels"                ).update(:seed => 12)

teams.filter(:name =>  "New Mexico State Aggies"           ).update(:seed => 13)
teams.filter(:name =>  "South Dakota State Jackrabbits"    ).update(:seed => 13)
teams.filter(:name =>  "Montana Grizzlies"                 ).update(:seed => 13)
teams.filter(:name =>  "Boise State Broncos"               ).update(:seed => 13)
teams.filter(:name =>  "La Salle Explorers"                ).update(:seed => 13)

teams.filter(:name =>  "Valparaiso Crusaders"              ).update(:seed => 14)
teams.filter(:name =>  "Northwestern State Demons"         ).update(:seed => 14)
teams.filter(:name =>  "Davidson Wildcats"                 ).update(:seed => 14)
teams.filter(:name =>  "Bucknell Bison"                    ).update(:seed => 14)
teams.filter(:name =>  "Harvard Crimson"                   ).update(:seed => 14)

teams.filter(:name =>  "Albany (NY) Great Danes"           ).update(:seed => 15)
teams.filter(:name =>  "Florida Gulf Coast Eagles"         ).update(:seed => 15)
teams.filter(:name =>  "Pacific Tigers"                    ).update(:seed => 15)
teams.filter(:name =>  "Iona Gaels"                        ).update(:seed => 15)

teams.filter(:name =>  "North Carolina A&amp;T Aggies"     ).update(:seed => 16)
teams.filter(:name =>  "Liberty Flames"                    ).update(:seed => 16)
teams.filter(:name =>  "Western Kentucky Hilltoppers"      ).update(:seed => 16)
teams.filter(:name =>  "James Madison Dukes"               ).update(:seed => 16)
teams.filter(:name =>  "Long Island University Blackbirds" ).update(:seed => 16)
teams.filter(:name =>  "Southern Jaguars"                  ).update(:seed => 16)
