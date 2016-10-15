puts 'deleting Users'
User.delete_all
puts 'deleting Jingles'
Jingle.delete_all
puts 'creating 25 Jingles'
FactoryGirl.create_list(:jingle, 25)
puts 'creating User with 3 jingles'
FactoryGirl.create_list(:user, 3, :with_jingels)
