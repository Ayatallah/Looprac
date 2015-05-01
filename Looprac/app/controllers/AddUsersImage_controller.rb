class AddUsersImageController < ApplicationController
 def change
    add_column :users, :avatar, :string
  end
end

