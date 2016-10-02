# app/helpers/users/application_helper.rb
module Users
  # ApplicationHelper
  module JinglesHelper
    # Link to delete user jingle
    def delete_user_jingle(path)
      link_to 'Destroy', path, data: { confirm: 'Are you sure?' }, method: :delete
    end
  end
end
