class SubscriptionController < ApplicationController
  def new
    email = params[:email]
    Subscription.create(:user_email=>email)
    render text: "success"
  end
end
