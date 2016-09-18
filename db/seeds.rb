puts 'deleting Users'
User.delete_all
puts 'deleting Jingles'
Jingle.delete_all


FactoryGirl.create_list(:user, 3, :with_jingels)
