namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    User.populate 1 do |user|
      user.email = "naren@gmail.com"
      user.encrypted_password = "$2a$10$qXoEKC9U8w0.bJubBcgCxOYyUakcNbccesAToXhJO1CDfPJxvNlG."
      user.reset_password_token = nil
      user.reset_password_sent_at = nil
      user.remember_created_at = nil
      user.sign_in_count = 12
      user.current_sign_in_at = "2015-05-12 09:31:49"
      user.last_sign_in_at = "2015-05-12 09:03:16"
      user.current_sign_in_ip = "127.0.0.1"
      user.last_sign_in_ip = "127.0.0.1"
      user.age = 50
      user.phone = "5412541254" 
      user.address = "asdadbj"
      user.first =  "naren" 
      user.last = "n"
      Post.populate 5 do |post|
        post.title = Faker::Lorem.sentence(2)
        post.description = Faker::Lorem.paragraph
        post.picture = Faker::Avatar.image("my-own-slug", "250x250", "jpg")
        post.consumer_id = 1
        post.price = Faker::Number.number(2)
        post.categories = %w(creative autombile)
        post.provider_id = nil
      end
    end

    Consumer.populate 1 do |consumer|
      consumer.user_id = 1
      consumer.rating = "2.5"
      consumer.count = 2
    end

    Provider.populate 1 do |provider|
      provider.user_id = 1
      provider.rating = "2.5"
      provider.count = 2
    end

    User.populate 1 do |usertwo|
      usertwo.email = "akshay@gmail.com"
      usertwo.encrypted_password = "$2a$10$gLef9TH.Q/ADBbtpjwLKWewN0BcnYwFWec6WnC2E15RZShC0YS2l."
      usertwo.reset_password_token = nil
      usertwo.reset_password_sent_at = nil
      usertwo.remember_created_at = nil
      usertwo.sign_in_count = 12
      usertwo.current_sign_in_at = "2015-05-12 09:31:49"
      usertwo.last_sign_in_at = "2015-05-12 09:03:16"
      usertwo.current_sign_in_ip = "127.0.0.1"
      usertwo.last_sign_in_ip = "127.0.0.1"
      usertwo.age = 50
      usertwo.phone = "5412541253" 
      usertwo.address = "asdadbj"
      usertwo.first =  "akshay" 
      usertwo.last = "v"
      Post.populate 5 do |posttwo|
        posttwo.title = Faker::Lorem.sentence(2)
        posttwo.description = Faker::Lorem.paragraph
        posttwo.picture = Faker::Avatar.image("my-own-slug", "250x250", "jpg")
        posttwo.consumer_id = 2
        posttwo.price = Faker::Number.number(2)
        posttwo.categories = %w(creative autombile)
        posttwo.provider_id = nil
      end
    end

    Consumer.populate 1 do |consumertwo|
      consumertwo.user_id = 2
      consumertwo.rating = "2.5"
      consumertwo.count = 2
    end

    Provider.populate 1 do |providertwo|
      providertwo.user_id = 2
      providertwo.rating = "2.5"
      providertwo.count = 2
    end

    User.populate 1 do |userthree|
      userthree.email = "praveen@gmail.com"
      userthree.encrypted_password = "$2a$10$GXSQtM0.w1TZgL2SVqIBbeOTdWcr19U0sK9a1J/MDCSSqrmZLh41y"
      userthree.reset_password_token = nil
      userthree.reset_password_sent_at = nil
      userthree.remember_created_at = nil
      userthree.sign_in_count = 12
      userthree.current_sign_in_at = "2015-05-12 09:31:49"
      userthree.last_sign_in_at = "2015-05-12 09:03:16"
      userthree.current_sign_in_ip = "127.0.0.1"
      userthree.last_sign_in_ip = "127.0.0.1"
      userthree.age = 50
      userthree.phone = "5412541253" 
      userthree.address = "asdadbj"
      userthree.first =  "praveen" 
      userthree.last = "a"
      Post.populate 5 do |posttwo|
        posttwo.title = Faker::Lorem.sentence(1)
        posttwo.description = Faker::Lorem.paragraph
        posttwo.picture = Faker::Avatar.image("my-own-slug", "250x250", "jpg")
        posttwo.consumer_id = 2
        posttwo.price = Faker::Number.number(2)
        posttwo.categories = %w(creative autombile)
        posttwo.provider_id = nil
      end
    end

    Consumer.populate 1 do |consumertwo|
      consumertwo.user_id = 3
      consumertwo.rating = "2.5"
      consumertwo.count = 2
    end

    Provider.populate 1 do |providertwo|
      providertwo.user_id = 3
      providertwo.rating = "2.5"
      providertwo.count = 2
    end
  end
end