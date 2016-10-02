# app/helpers/users/application_helper.rb
module Users
  # ApplicationHelper
  module JinglesHelper
    # Link to delete user jingle
    def delete_user_jingle(path)
      content_tag(:a, 'Destroy', data: { confirm: 'Are you sure?', method: :delete }, href: path)
    end
  end
end
