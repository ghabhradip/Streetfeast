class PaymentController < ApplicationController
  skip_before_action :verify_authenticity_token
  

  def new
    gateway = Braintree::Gateway.new(
      :environment => :sandbox,
      :merchant_id => "jfbrrxtxkjt674zy",
      :public_key => "f7dytmhs9n9mcv9j",
      :private_key => "759a355f367077223e36d763bf453a0c",
    )

    @client_token = gateway.client_token.generate

  end

  def create
    
    gateway = Braintree::Gateway.new(
      :environment => :sandbox,
      :merchant_id => "jfbrrxtxkjt674zy",
      :public_key => "f7dytmhs9n9mcv9j",
      :private_key => "759a355f367077223e36d763bf453a0c",
    )
    result = gateway.transaction.sale(
      :amount => params[:amount],
      :payment_method_nonce => params[:paymentMethodNonce],
      :options => {
        :submit_for_settlement => true
      }
    )

    if result.success?
      render text: "success"
    else
      redirect_to :back
      flash[:notice] = "Error!Please try again!#{result.message}"
    end
    #result = gateway.transaction.refund("the_transaction_id")
  end

end
