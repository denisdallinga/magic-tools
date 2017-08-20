Poule.delete_all

User.create!(email: 'denis@magictools.nl', password: 'Monkey Business', password_confirmation: 'Monkey Business', active: true, approved: true, confirmed: true)
User.create!(email: 'gerjan@magictools.nl', password: 'Monkey Business', password_confirmation: 'Monkey Business', active: true, approved: true, confirmed: true)
User.create!(email: 'casper@magictools.nl', password: 'Monkey Business', password_confirmation: 'Monkey Business', active: true, approved: true, confirmed: true)
User.create!(email: 'werner@magictools.nl', password: 'Monkey Business', password_confirmation: 'Monkey Business', active: true, approved: true, confirmed: true)
User.create!(email: 'eize@magictools.nl', password: 'Monkey Business', password_confirmation: 'Monkey Business', active: true, approved: true, confirmed: true)

Poule.delete_all
poule = Poule.create!(name: "Conspiracy take the crown sessie 1")

Player.create!(user: User.find_by_email('denis@magictools.nl'), poule: poule)
Player.create!(user: User.find_by_email('gerjan@magictools.nl'), poule: poule)
Player.create!(user: User.find_by_email('casper@magictools.nl'), poule: poule)
Player.create!(user: User.find_by_email('werner@magictools.nl'), poule: poule)
Player.create!(user: User.find_by_email('eize@magictools.nl'), poule: poule)

poule.reload
poule.start_dice_roll!
player_1.roll_dice
player_2.roll_dice
poule.dice_roll_rounds.first.compute_state_and_assign_positions
