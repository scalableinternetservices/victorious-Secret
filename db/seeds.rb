User.create!([
  {email: "naren@gmail.com", encrypted_password: "$2a$10$hG2OBMyMUlzTzOtG1QQuTeAcD8B8v7HnRHBKSFdLpa7lyCSL4doku", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 23, current_sign_in_at: "2015-05-08 23:34:49", last_sign_in_at: "2015-05-08 23:30:54", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", age: 22, phone: "4125412541", address: "ioasjdasd", first: "naren", last: "n", picture: "images.jpg"},
  {email: "akshay@gmail.com", encrypted_password: "$2a$10$mnacfwY8CFKyPUMtVpvm2e0QmlRvmV6opXoUhE2SrBpMKAXl./B46", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 13, current_sign_in_at: "2015-05-09 00:21:11", last_sign_in_at: "2015-05-09 00:05:08", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", age: 25, phone: "8745874587", address: "asndoasd", first: "akshay", last: "v", picture: "images.jpg"},
  {email: "praveen@gmail.com", encrypted_password: "$2a$10$v1U8R3YKjWsYRRTr53f0teQZKEsxA8w/540B555fK6.WpJf.T7NO2", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 7, current_sign_in_at: "2015-05-08 23:25:53", last_sign_in_at: "2015-05-08 22:52:28", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", age: 50, phone: "5487454785", address: "asdashdvaifb", first: "praveen", last: "a", picture: "images.jpg"}
])
Bid.create!([
  {provider_id: 11, post_id: 36, amount: 20, description: "aisdjasd"},
  {provider_id: 10, post_id: 37, amount: 50, description: "asndiausd"},
  {provider_id: 10, post_id: 38, amount: 50, description: "asdas"},
  {provider_id: 12, post_id: 38, amount: 20, description: "asndoasnd"},
  {provider_id: 10, post_id: 39, amount: 50, description: "ajs da sd"},
  {provider_id: 10, post_id: 44, amount: 50, description: "asdasd"},
  {provider_id: 10, post_id: 43, amount: 50, description: "asdasd"}
])
Consumer.create!([
  {user_id: 20, rating: 0, count: 0},
  {user_id: 21, rating: 0, count: 0},
  {user_id: 22, rating: 0, count: 0}
])
Post.create!([
  {title: "asdsd", description: "ajldasd", picture: nil, consumer_id: 12, price: 50, categories: ["beauty"], provider_id: 10},
  {title: "asdsd", description: "ajldasd", picture: nil, consumer_id: 12, price: 50, categories: ["beauty"], provider_id: 10},
  {title: "h1", description: "asoidsd", picture: nil, consumer_id: 10, price: 50, categories: ["beauty"], provider_id: nil},
  {title: "snaodn", description: "apudnaopusd", picture: "images.jpg", consumer_id: 10, price: 50, categories: ["beauty"], provider_id: nil},
  {title: "aiosd", description: "asjndoasnd", picture: nil, consumer_id: 10, price: 50, categories: ["automobile"], provider_id: nil},
  {title: "hello all I need someting", description: "aindand", picture: nil, consumer_id: 12, price: 80, categories: ["beauty"], provider_id: 10},
  {title: "hi ", description: "adouasodua", picture: nil, consumer_id: 11, price: 50, categories: ["computer", "creative"], provider_id: 12},
  {title: "hi", description: "asasd", picture: nil, consumer_id: 11, price: 80, categories: ["beauty"], provider_id: 10},
  {title: "hello all ", description: "asodnaosndoisad", picture: nil, consumer_id: 10, price: 50, categories: ["beauty"], provider_id: 11}
])
Proreview.create!([
  {rating: 5, description: "asjdasd", consumer_id: 10, post_id: 36},
  {rating: 0, description: "csc", consumer_id: 12, post_id: 39},
  {rating: 2, description: "asd", consumer_id: 12, post_id: 44},
  {rating: 2, description: "jasd", consumer_id: 11, post_id: 38}
])
Provider.create!([
  {user_id: 20, rating: 1, count: 2},
  {user_id: 21, rating: 5, count: 1},
  {user_id: 22, rating: 2, count: 1}
])
