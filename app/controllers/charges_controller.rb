class ChargesController < ApplicationController

  def new
  end

  def create
    # Amount in cents
    #@amount = 500
    if current_user.stripe_id == nil
    customer = Stripe::Customer.create({
      email: current_user.email,
      source: params[:stripeToken],
    })
    else
    customer = ::Stripe::Customer.retrieve(current_user.stripe_id)
    ##customer.save
    end

    subscription = Stripe::Subscription.create({
    customer: customer.id,
    #plan: "plan_G8FtqbcawJzjs9" Canada Dollar
    plan: "prod_HlMfZ4YNme6FUS" #Japanese Yen
    })

    current_user.payment = true
    current_user.stripe_id = customer.id
    current_user.subscription_id = subscription.id
    current_user.purchase_date = subscription.created
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

   def unsubscribe

      subscription = Stripe::Subscription.update(
      current_user.subscription_id,
      {
        cancel_at_period_end: true,
      })

      current_user.payment = false
      current_user.cancel_date = subscription.canceled_at
      current_user.save

      redirect_to new_charge_path

   end

end
