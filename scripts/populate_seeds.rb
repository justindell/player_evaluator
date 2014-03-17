require 'sequel'

DB = Sequel.sqlite('players.sqlite')
teams = DB[:teams]
teams.update(seed: nil)

teams.filter(name: "Florida Gators"                   ).update(seed: 1)
teams.filter(name: "Wichita State Shockers"           ).update(seed: 1)
teams.filter(name: "Arizona Wildcats"                 ).update(seed: 1)
teams.filter(name: "Virginia Cavaliers"               ).update(seed: 1)

teams.filter(name: "Michigan Wolverines"              ).update(seed: 2)
teams.filter(name: "Kansas Jayhawks"                  ).update(seed: 2)
teams.filter(name: "Wisconsin Badgers"                ).update(seed: 2)
teams.filter(name: "Villanova Wildcats"               ).update(seed: 2)

teams.filter(name: "Duke Blue Devils"                 ).update(seed: 3)
teams.filter(name: "Creighton Bluejays"               ).update(seed: 3)
teams.filter(name: "Syracuse Orange"                  ).update(seed: 3)
teams.filter(name: "Iowa State Cyclones"              ).update(seed: 3)

teams.filter(name: "San Diego State Aztecs"           ).update(seed: 4)
teams.filter(name: "Louisville Cardinals"             ).update(seed: 4)
teams.filter(name: "UCLA Bruins"                      ).update(seed: 4)
teams.filter(name: "Michigan State Spartans"          ).update(seed: 4)

teams.filter(name: "Saint Louis Billikens"            ).update(seed: 5)
teams.filter(name: "Cincinnati Bearcats"              ).update(seed: 5)
teams.filter(name: "Virginia Commonwealth Rams"       ).update(seed: 5)
teams.filter(name: "Oklahoma Sooners"                 ).update(seed: 5)

teams.filter(name: "North Carolina Tar Heels"         ).update(seed: 6)
teams.filter(name: "Massachusetts Minutemen"          ).update(seed: 6)
teams.filter(name: "Ohio State Buckeyes"              ).update(seed: 6)
teams.filter(name: "Baylor Bears"                     ).update(seed: 6)

teams.filter(name: "New Mexico Lobos"                 ).update(seed: 7)
teams.filter(name: "Oregon Ducks"                     ).update(seed: 7)
teams.filter(name: "Connecticut Huskies"              ).update(seed: 7)
teams.filter(name: "Texas Longhorns"                  ).update(seed: 7)

teams.filter(name: "Colorado Buffaloes"               ).update(seed: 8)
teams.filter(name: "Gonzaga Bulldogs"                 ).update(seed: 8)
teams.filter(name: "Kentucky Wildcats"                ).update(seed: 8)
teams.filter(name: "Memphis Tigers"                   ).update(seed: 8)

teams.filter(name: "Oklahoma State Cowboys"           ).update(seed: 9)
teams.filter(name: "Pittsburg Panthers"               ).update(seed: 9)
teams.filter(name: "George Washington Colonials"      ).update(seed: 9)
teams.filter(name: "Kansas State Wildcats"            ).update(seed: 9)

teams.filter(name: "Stanford Cardinal"                ).update(seed: 10)
teams.filter(name: "Arizona State Sun Devils"         ).update(seed: 10)
teams.filter(name: "Saint Joseph's Hawks"             ).update(seed: 10)
teams.filter(name: "Brigham Young Cougars"            ).update(seed: 10)

teams.filter(name: "Nebraska Cornhuskers"             ).update(seed: 11)
teams.filter(name: "Iowa Hawkeyes"                    ).update(seed: 11)
teams.filter(name: "Dayton Flyers"                    ).update(seed: 11)
teams.filter(name: "Providence Friars"                ).update(seed: 11)
teams.filter(name: "Tennessee Volunteers"             ).update(seed: 11)

teams.filter(name: "Xavier Musketeers"                ).update(seed: 12)
teams.filter(name: "North Carolina State Wolfpack"    ).update(seed: 12)
teams.filter(name: "Stephen F. Austin Lumberjacks    ").update(seed: 12)
teams.filter(name: "North Dakota State Bison"         ).update(seed: 12)
teams.filter(name: "Harvard Crimson"                  ).update(seed: 12)

teams.filter(name: "Manhattan Jaspers"                ).update(seed: 13)
teams.filter(name: "Delaware Fightin' Blue Hens"      ).update(seed: 13)
teams.filter(name: "New Mexico State Aggies"          ).update(seed: 13)
teams.filter(name: "Tulsa Golden Hurricane"           ).update(seed: 13)

teams.filter(name: "Western Michigan Broncos"         ).update(seed: 14)
teams.filter(name: "Louisiana-Lafayette Ragin' Cajuns").update(seed: 14)
teams.filter(name: "Mercer Bears"                     ).update(seed: 14)
teams.filter(name: "North Carolina Central Eagles"    ).update(seed: 14)

teams.filter(name: "Milwaukee Panthers"               ).update(seed: 15)
teams.filter(name: "Wofford Terriers"                 ).update(seed: 15)
teams.filter(name: "American Eagles"                  ).update(seed: 15)
teams.filter(name: "Eastern Kentucky Colonels"        ).update(seed: 15)

teams.filter(name: "Albany (NY) Great Danes"          ).update(seed: 16)
teams.filter(name: "Mount St. Mary's Mountaineers"    ).update(seed: 16)
teams.filter(name: "Texas Southern Tigers"            ).update(seed: 16)
teams.filter(name: "Cal Poly Mustangs"                ).update(seed: 16)
teams.filter(name: "Coastal Carolina Chanticleers"    ).update(seed: 16)
teams.filter(name: "Weber State Wildcats"             ).update(seed: 16)
