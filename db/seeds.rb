# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = {
    email:      'admin@storify.com',
    first_name: 'The Admin',
    last_name:  'Last Name',
    gender:     'male',

}
begin
  Admin.new(user).save
rescue

end


Product.create({
                   name:             'Book1',
                   description:      'This book is very good',
                   sku:              'BO_EL_F1_P234',
                   meta_title:       'A book on electronics',
                   meta_description: 'This book has a long description',
                   tags:             'Electronics, The book, 100Pages',
                   available_from:   2.days.from_now,
                   available_upto:   45.days.from_now,
                   cost_price:       100,
                   selling_price:    120.34,
                   owner_id:         1
               })

Product.create({
                   name:             'Book2',
                   description:      'This book is very good',
                   sku:              'BO_EL_F1_P234',
                   meta_title:       'A book on electronics',
                   meta_description: 'This book has a long description',
                   tags:             'Electronics, The book, 100Pages',
                   available_from:   2.days.from_now,
                   available_upto:   45.days.from_now,
                   cost_price:       100,
                   selling_price:    120.34,
                   owner_id:         1

               })

Product.create({
                   name:             'Book3',
                   description:      'This book is very good',
                   sku:              'BO_EL_F1_P234',
                   meta_title:       'A book on electronics',
                   meta_description: 'This book has a long description',
                   tags:             'Electronics, The book, 100Pages',
                   available_from:   2.days.from_now,
                   available_upto:   45.days.from_now,
                   cost_price:       100,
                   selling_price:    120.34,
                   owner_id:         1

               })

Product.create({
                   name:             'Book4',
                   description:      'This book is very good',
                   sku:              'BO_EL_F1_P234',
                   meta_title:       'A book on electronics',
                   meta_description: 'This book has a long description',
                   tags:             'Electronics, The book, 100Pages',
                   available_from:   2.days.from_now,
                   available_upto:   45.days.from_now,
                   cost_price:       100,
                   selling_price:    120.34,
                   owner_id:         1

               })
