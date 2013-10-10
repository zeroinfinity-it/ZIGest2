namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(nome: "Gianni", cognome: "Codevico", eta: "39",
                 email: "gianni.codevico@zeroinfinity.it",
                 password: "codevico",
                 password_confirmation: "codevico",admin: true)
    99.times do |n|
      nome,cognome  = Faker::Name.name.split
      email = "esempio-#{n+1}@railstutorial.org"
      eta = 30
      password  = "password"
      User.create!(nome: nome, cognome: cognome, eta: eta,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end