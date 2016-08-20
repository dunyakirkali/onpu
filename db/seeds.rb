User.delete_all
Jingle.delete_all

FactoryGirl.create_list(:user, 3, :with_jingels)
