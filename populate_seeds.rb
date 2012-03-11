require 'sequel'

DB = Sequel.sqlite('players.sqlite')

DB[:teams].filter(:name =>  "Kentucky Wildcats"                 ).update(:seed => 1)
DB[:teams].filter(:name =>  "Michigan State Spartans"           ).update(:seed => 1)
DB[:teams].filter(:name =>  "Syracuse Orange"                   ).update(:seed => 1)
DB[:teams].filter(:name =>  "North Carolina Tar Heels"          ).update(:seed => 1)

DB[:teams].filter(:name =>  "Ohio State Buckeyes"               ).update(:seed => 2)
DB[:teams].filter(:name =>  "Kansas Jayhawks"                   ).update(:seed => 2)
DB[:teams].filter(:name =>  "Missouri Tigers"                   ).update(:seed => 2)
DB[:teams].filter(:name =>  "Duke Blue Devils"                  ).update(:seed => 2)

DB[:teams].filter(:name =>  "Baylor Bears"                      ).update(:seed => 3)
DB[:teams].filter(:name =>  "Marquette Golden Eagles"           ).update(:seed => 3)
DB[:teams].filter(:name =>  "Florida State Seminoles"           ).update(:seed => 3)
DB[:teams].filter(:name =>  "Georgetown Hoyas"                  ).update(:seed => 3)

DB[:teams].filter(:name =>  "Indiana Hoosiers"                  ).update(:seed => 4)
DB[:teams].filter(:name =>  "Wisconsin Badgers"                 ).update(:seed => 4)
DB[:teams].filter(:name =>  "Louisville Cardinals"              ).update(:seed => 4)
DB[:teams].filter(:name =>  "Michigan Wolverines"               ).update(:seed => 4)

DB[:teams].filter(:name =>  "Wichita State Shockers"            ).update(:seed => 5)
DB[:teams].filter(:name =>  "New Mexico Lobos"                  ).update(:seed => 5)
DB[:teams].filter(:name =>  "Vanderbilt Commodores"             ).update(:seed => 5)
DB[:teams].filter(:name =>  "Temple Owls"                       ).update(:seed => 5)

DB[:teams].filter(:name =>  "Nevada-Las Vegas Rebels"           ).update(:seed => 6)
DB[:teams].filter(:name =>  "Murray State Racers"               ).update(:seed => 6)
DB[:teams].filter(:name =>  "Cincinnati Bearcats"               ).update(:seed => 6)
DB[:teams].filter(:name =>  "San Diego State Aztecs"            ).update(:seed => 6)

DB[:teams].filter(:name =>  "Notre Dame Fighting Irish"         ).update(:seed => 7)
DB[:teams].filter(:name =>  "Florida Gators"                    ).update(:seed => 7)
DB[:teams].filter(:name =>  "Gonzaga Bulldogs"                  ).update(:seed => 7)
DB[:teams].filter(:name =>  "Saint Mary's (CA) Gaels"           ).update(:seed => 7)

DB[:teams].filter(:name =>  "Iowa State Cyclones"               ).update(:seed => 8)
DB[:teams].filter(:name =>  "Memphis Tigers"                    ).update(:seed => 8)
DB[:teams].filter(:name =>  "Kansas State Wildcats"             ).update(:seed => 8)
DB[:teams].filter(:name =>  "Creighton Bluejays"                ).update(:seed => 8)

DB[:teams].filter(:name =>  "Alabama Crimson Tide"              ).update(:seed => 9)
DB[:teams].filter(:name =>  "Saint Louis Billikens"             ).update(:seed => 9)
DB[:teams].filter(:name =>  "Southern Mississippi Golden Eagles").update(:seed => 9)
DB[:teams].filter(:name =>  "Connecticut Huskies"               ).update(:seed => 9)

DB[:teams].filter(:name =>  "Xavier Musketeers"                 ).update(:seed => 10)
DB[:teams].filter(:name =>  "Virginia Cavaliers"                ).update(:seed => 10)
DB[:teams].filter(:name =>  "Purdue Boilermakers"               ).update(:seed => 10)
DB[:teams].filter(:name =>  "West Virginia Mountaineers"        ).update(:seed => 10)

DB[:teams].filter(:name =>  "Colorado Buffaloes"                ).update(:seed => 11)
DB[:teams].filter(:name =>  "Colorado State Rams"               ).update(:seed => 11)
DB[:teams].filter(:name =>  "Texas Longhorns"                   ).update(:seed => 11)
DB[:teams].filter(:name =>  "North Carolina State Wolfpack"     ).update(:seed => 11)

DB[:teams].filter(:name =>  "Virginia Commonwealth Rams"        ).update(:seed => 12)
DB[:teams].filter(:name =>  "Long Beach State Forty Niners"     ).update(:seed => 12)
DB[:teams].filter(:name =>  "Harvard Crimson"                   ).update(:seed => 12)
DB[:teams].filter(:name =>  "California Golden Bears"           ).update(:seed => 12)
DB[:teams].filter(:name =>  "South Florida Bulls"               ).update(:seed => 12)

DB[:teams].filter(:name =>  "New Mexico State Aggies"           ).update(:seed => 13)
DB[:teams].filter(:name =>  "Davidson Wildcats"                 ).update(:seed => 13)
DB[:teams].filter(:name =>  "Montana Grizzlies"                 ).update(:seed => 13)
DB[:teams].filter(:name =>  "Ohio Bobcats"                      ).update(:seed => 13)

DB[:teams].filter(:name =>  "South Dakota State Jackrabbits"    ).update(:seed => 14)
DB[:teams].filter(:name =>  "St. Bonaventure Bonnies"           ).update(:seed => 14)
DB[:teams].filter(:name =>  "Belmont Bruins"                    ).update(:seed => 14)
DB[:teams].filter(:name =>  "Brigham Young Cougars"             ).update(:seed => 14)
DB[:teams].filter(:name =>  "Iona Gaels"                        ).update(:seed => 14)

DB[:teams].filter(:name =>  "Loyola (MD) Greyhounds"            ).update(:seed => 15)
DB[:teams].filter(:name =>  "Lehigh Mountain Hawks"             ).update(:seed => 15)

