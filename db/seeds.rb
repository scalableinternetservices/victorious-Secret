User.create!([
  {email: "naren@gmail.com", encrypted_password: "$2a$10$qXoEKC9U8w0.bJubBcgCxOYyUakcNbccesAToXhJO1CDfPJxvNlG.", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 12, current_sign_in_at: "2015-05-12 09:31:49", last_sign_in_at: "2015-05-12 09:03:16", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", age: 50, phone: "5412541254", address: "asdadbj", first: "naren", last: "n", picture: "images.jpg"},
  {email: "akshay@gmail.com", encrypted_password: "$2a$10$gLef9TH.Q/ADBbtpjwLKWewN0BcnYwFWec6WnC2E15RZShC0YS2l.", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 8, current_sign_in_at: "2015-05-12 09:08:03", last_sign_in_at: "2015-05-12 06:52:50", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", age: 50, phone: "4154154152", address: "aojnsdoansdonadon", first: "akshay", last: "v", picture: "images.jpg"},
  {email: "praveen@gmail.com", encrypted_password: "$2a$10$GXSQtM0.w1TZgL2SVqIBbeOTdWcr19U0sK9a1J/MDCSSqrmZLh41y", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 3, current_sign_in_at: "2015-05-12 06:26:40", last_sign_in_at: "2015-05-11 08:45:24", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", age: 50, phone: "4587458745", address: "asdasd", first: "praveen", last: "a", picture: "images.jpg"}
])
Bid.create!([
  {provider_id: 2, post_id: 1, amount: 50, description: "asdas"},
  {provider_id: 2, post_id: 5, amount: 50, description: "asdasda"},
  {provider_id: 2, post_id: 4, amount: 50, description: "asdasd"},
  {provider_id: 3, post_id: 3, amount: 50, description: "adasdasdasd"},
  {provider_id: 1, post_id: 7, amount: 5, description: "asdasd"}
])
Conreview.create!([
  {rating: 3, description: "dasasd", provider_id: 2, post_id: 4},
  {rating: 2, description: "asdadasd", provider_id: 2, post_id: 5}
])
Consumer.create!([
  {user_id: 1, rating: "2.5", count: 2},
  {user_id: 2, rating: "0.0", count: 0},
  {user_id: 3, rating: "0.0", count: 0}
])
Notification.create!([
  {post_id: 3, bid_id: nil},
  {post_id: nil, bid_id: 5}
])
Post.create!([
  {title: "asdasdasdadinaossaopdfnoasbouasbfoubsafoupbsaofbsdauofb", description: "dabdad", picture: nil, consumer_id: 2, price: 40, categories: ["general"], provider_id: nil},
  {title: "adasd", description: "asdasd", picture: nil, consumer_id: 2, price: 40, categories: ["beauty"], provider_id: nil},
  {title: "car wash ", description: "aspdimadimasdm", picture: "images.jpg", consumer_id: 1, price: 10, categories: ["automobile"], provider_id: 2},
  {title: "asdasd", description: "asdasd", picture: "images.jpg", consumer_id: 1, price: 25, categories: ["creative"], provider_id: 2},
  {title: "asdas", description: "asdasd", picture: "images.jpg", consumer_id: 1, price: 50, categories: ["computer"], provider_id: 3},
  {title: "ads", description: "asdasdads", picture: nil, consumer_id: 1, price: 25, categories: ["general"], provider_id: nil},
  {title: "asd", description: "asdasd", picture: nil, consumer_id: 1, price: 50, categories: ["computer"], provider_id: 2}
])
Proreview.create!([
  {rating: 3, description: "asdasd", consumer_id: 1, post_id: 4},
  {rating: 4, description: "asdasdk;ads", consumer_id: 1, post_id: 5}
])
Provider.create!([
  {user_id: 1, rating: "0.0", count: 0},
  {user_id: 2, rating: "3.5", count: 2},
  {user_id: 3, rating: "0.0", count: 0}
])
