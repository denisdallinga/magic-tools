def init_users
  User.create!(email: 'denis@magictools.nl', password: 'Monkey Business', password_confirmation: 'Monkey Business', active: true, approved: true, confirmed: true)
  User.create!(email: 'gerjan@magictools.nl', password: 'Monkey Business', password_confirmation: 'Monkey Business', active: true, approved: true, confirmed: true)
  User.create!(email: 'casper@magictools.nl', password: 'Monkey Business', password_confirmation: 'Monkey Business', active: true, approved: true, confirmed: true)
  User.create!(email: 'werner@magictools.nl', password: 'Monkey Business', password_confirmation: 'Monkey Business', active: true, approved: true, confirmed: true)
  User.create!(email: 'eize@magictools.nl', password: 'Monkey Business', password_confirmation: 'Monkey Business', active: true, approved: true, confirmed: true)
end

def init_test_cards
  Card.create!(card_name: 'Giant Spider', rarity: 'C', image_url: 'http://www.black-lotus.nl/mtg/lg/Alpha/Giant_Spider.jpg')
  Card.create!(card_name: 'Llanowar Elves', rarity: 'C', image_url: 'http://www.black-lotus.nl/mtg/lg/Alpha/Llanowar_Elves.jpg')
  Card.create!(card_name: 'Grizzly Bears', rarity: 'C', image_url: 'http://www.black-lotus.nl/mtg/lg/Alpha/Grizzly_Bears.jpg')
  Card.create!(card_name: 'Fog', rarity: 'C', image_url: 'http://www.black-lotus.nl/mtg/lg/Alpha/Fog.jpg')
  Card.create!(card_name: 'Giant Growth', rarity: 'C', image_url: 'http://www.black-lotus.nl/mtg/lg/Alpha/Giant_Growth.jpg')
end

def init_card_picks
  CardPick.create(card: Card.find_by_card_name('Giant Spider'), poule: Poule.first)
  CardPick.create(card: Card.find_by_card_name('Llanowar Elves'), poule: Poule.first)
  CardPick.create(card: Card.find_by_card_name('Grizzly Bears'), poule: Poule.first)
  CardPick.create(card: Card.find_by_card_name('Fog'), poule: Poule.first)
  CardPick.create(card: Card.find_by_card_name('Giant Growth'), poule: Poule.first)
end

Poule.delete_all
CardPick.delete_all
Card.delete_all
Player.delete_all
poule = Poule.create!(name: "Conspiracy take the crown sessie 1")

Player.create!(user: User.find_by_email('denis@magictools.nl'), poule: poule)
Player.create!(user: User.find_by_email('gerjan@magictools.nl'), poule: poule)
Player.create!(user: User.find_by_email('casper@magictools.nl'), poule: poule)
Player.create!(user: User.find_by_email('werner@magictools.nl'), poule: poule)
Player.create!(user: User.find_by_email('eize@magictools.nl'), poule: poule)

poule.reload
poule.start_dice_roll!

