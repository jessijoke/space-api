# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#jess_res = Reservation.create(name: "Jessica", reservation_number: 38576239981, wheelchair: 0, ald: 0, total: 72)
jessticket0 = Ticket.create(ticket_type: "adult", reservation_id: 1)
jessticket1 = Ticket.create(ticket_type: "adult", reservation_id: 1)
jessticket2 = Ticket.create(ticket_type: "child", reservation_id: 1)
jessticket3 = Ticket.create(ticket_type: "child", reservation_id: 1)