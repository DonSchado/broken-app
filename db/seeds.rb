
user_marco = User.create!(password: '123456', name: 'Marco', email: 'marco@facebook.com', avatar: 'https://avatars0.githubusercontent.com/u/685742')
user_liane = User.create!(password: '123456', name: 'Liane', email: 'liane@facebook.com', avatar: 'https://avatars2.githubusercontent.com/u/1529276')
random_dude = User.create!(password: '123456', name: 'Random Dude', email: 'random_dude@facebook.com', avatar: 'https://github.com/identicons/c55f44ac45b4348a5ac957dd91062e0f.png')

user_marco.posts.create(content: 'Hallo Welt!', created_at: 2.hours.ago)
user_marco.posts.create(content: 'Hallo, ist da wer?', created_at: 1.hour.ago)

user_liane.posts.create(content: 'Ich bin hier!!!', created_at: 30.minutes.ago)
