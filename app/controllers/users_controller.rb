class UsersController < ApplicationController
  def main
   redirect_to("/users")
  end
  def all_users
    matching_users = User.all
    @users = matching_users.order(:created_at)

    render({ :template => "user_templates/all_users.html.erb"})
  end
  
  def show
    username = params.fetch("username")
    matching_users = User.where({ :username => username })
    @user = matching_users.at(0)

    render({ :template => "user_templates/user_details.html.erb"})
  end
  
  def create
    insert_username = params.fetch("insert_username")
    user = User.new
    user.username = insert_username
    user.save
    
    redirect_to("/users/#{user.username}")
  end
  
  def update
    user_name = params.fetch("user_name")
    matching_users = User.where({ :username => user_name })
    the_user = matching_users.at(0)

    query_username = params.fetch("query_username")
    
    the_user.username = query_username
    the_user.save
    redirect_to("/users/#{the_user.username}")
  end

end
