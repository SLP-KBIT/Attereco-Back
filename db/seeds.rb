# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(sid: 'admin', password: 'adminpass', role: 100, phone: '000-0000-0000', address: 'address', birthday: '2015-07-17', name: 'admin', email: 'admin@hoge.com')
