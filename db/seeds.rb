# encoding: utf-8

User.create!(email: "admin@example.com",
             first_name: "Admin",
             last_name: "Admin",
             middle_name: "Admin",
             phone: "+70000000000",
             city: "Kazan",
             status: "approved",
             admin: true,
             document: Rails.root.join("db/files/man.png").open,
             password: 'password')
