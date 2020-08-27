class ToppageController < ApplicationController
  
  def index
    if current_admin
      redirect_to current_admin
    end
  end
  
  
  def how_to
  end
  
  def cancel_policy
  end
  
  def company
  end
  
  private
  
  
end
