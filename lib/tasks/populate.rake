require 'open-uri'
namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    phone = 1000000000
    index = 0
    User.populate 1000 do |user|
      phone = phone + 1
      index = index + 1
      user.email = "naren"+index.to_s+"@gmail.com"
      user.encrypted_password = "$2a$10$qXoEKC9U8w0.bJubBcgCxOYyUakcNbccesAToXhJO1CDfPJxvNlG."
      user.reset_password_token = nil
      user.reset_password_sent_at = nil
      user.remember_created_at = nil
      user.sign_in_count = 12
      user.current_sign_in_at = "2015-05-12 09:31:49"
      user.last_sign_in_at = "2015-05-12 09:03:16"
      user.current_sign_in_ip = Faker::Internet.ip_v4_address
      user.last_sign_in_ip = Faker::Internet.ip_v4_address
      user.age = Faker::Number.number(2)
      user.phone = phone 
      user.address = "457 Portola Plaza, Los Angeles, CA 90095"
      user.first =  Faker::Internet.user_name
      user.last = Faker::Internet.user_name
      Post.populate 50 do |post|
        post.title = Faker::Lorem.sentence(2)
        post.description = Faker::Lorem.paragraph
        post.consumer_id = index
        post.price = Faker::Number.number(2)
        post.categories = ["creative"]
        post.provider_id = nil
        post.address = "457 Portola Plaza, Los Angeles, CA 90095"
      end
      Consumer.populate 1 do |consumer|
        consumer.user_id = index
        consumer.rating = "2.5"
        consumer.count = 2
      end
      Provider.populate 1 do |provider|
        provider.user_id = index
        provider.rating = "2.5"
        provider.count = 2
      end
    end
  end
end
