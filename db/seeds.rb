Movie.create!([
                { title: 'Star Wars', plot: 'Star Wars Plot...' },
                { title: 'Lord of the Rings', plot: 'Lord of the Rings Plot...'}
              ])

seasons = Season.create!([
                           { title: 'Money Heist', plot: 'This is season one of Money heist', number: 1},
                           { title: 'Drakula', plot: 'This is season one of Drakula', number: 1}
                         ])

Episode.create!([
                  { title: 'Crew Creation', plot: 'Crew is created for Money heist', number: 1, season: seasons.first},
                  { title: 'Bank Cameras', plot: 'Bank cameras are hacked for Money heist', number: 2, season: seasons.first},
                  { title: 'Count Drakula', plot: 'Introduction to Count Drakula', number: 1, season: seasons.last},
                  { title: 'Castle Black', plot: 'the one in the castle', number: 2, season: seasons.last}
                ])

user = User.create!({ email: 'gaurav.malik2034@gmail.com' })

Purchase.create!([
                   { price: 2.99, quality: 'HD', user: user, season: seasons.first, validity: (Time.now.utc + 2.days) }
                 ])
