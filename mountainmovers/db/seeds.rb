5.times do
    Article.create({
        title: Faker::Book.title,
        body: Faker::Lorem.sentence
    })
end

5.times do 
    Identity.create({
        title: Faker::Book.title,
        body: Faker::Lorem.sentence
    })
end

5.times do
    Value.create({
        title: Faker::Book.title,
        body: Faker::Lorem.sentence
    })
end

5.times do
    Teammember.create({
        name: Faker::Book.title,
        role: Faker::Lorem.sentence,
        description: Faker::HarryPotter.quote,
        image: Faker::LoremFlickr
    })
end