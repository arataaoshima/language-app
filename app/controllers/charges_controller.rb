class ChargesController < ApplicationController

  def new
  end

  def create
    # Amount in cents
    @amount = 500

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    subscription = Stripe::Subscription.create({
    customer: customer.id,
    plan: "plan_G8FtqbcawJzjs9"
    })

    current_user.payment = true
    current_user.stripe_id = customer.id
    current_user.subscription_id = subscription.id
    current_user.purchate_date = subscription.created
    current_user.save

  #  charge = Stripe::Charge.create({
  #    customer: customer.id,
  #    amount: @amount,
  #    description: 'Rails Stripe customer',
  #    currency: 'usd',
  #  })

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
   end

end
