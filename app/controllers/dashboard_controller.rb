
class DashboardController < ApplicationController

def dashboard
  render 'dashboard/dashboard'
end

def show
  index(user_id: params[:user_id], conversation_id: params[:conversation_id].first)
end

def pre_index
  render 'dashboard/pre_index'
end

def pre_index_tutor
  render 'dashboard/pre_index_tutor'
end

def update_bio_subjects
  current_user.update(bio: params[:bio], subject:split_subjects)
  render 'dashboard/dashboard'
end

private

def login_params
  params.require(:bio).permit(:subjects)
end


def split_subjects()
  if params[:subject]
    if params[:subject].length > 1
      params[:subject].split(',')
    elsif params[:subject] == ''
      params[:subject] = []
    else
      params[:subject]
    end
  else
    nil
  end
end
end
