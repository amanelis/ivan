# == Schema Information
#
# Table name: customers
#
#  id                               :integer          not null, primary key
#  email                            :string(255)
#  crypted_password                 :string(255)
#  password_salt                    :string(255)
#  persistence_token                :string(255)
#  first_name                       :string(255)
#  last_name                        :string(255)
#  invite_code                      :string(255)
#  created_at                       :datetime
#  updated_at                       :datetime
#  active                           :boolean          default(FALSE)
#  perishable_token                 :string(255)
#  stripe_customer_token            :string(255)
#  stripe_customer_id               :string(255)
#  birthdate                        :date
#  phone                            :string(255)
#  gender                           :string(255)
#  marital_status                   :string(255)
#  anniversary                      :date
#  partners_email_address           :string(255)
#  first_login                      :boolean
#  vday_customer                    :boolean          default(FALSE)
#  invite_reference_code            :string(255)
#  shop_type                        :string(255)
#  anonymous                        :boolean          default(FALSE)
#  password_reminder_delayed_job_id :integer
#  mailsubscribe                    :boolean          default(TRUE)
#  completed_nps_at                 :datetime
#  children                         :boolean
#  cx_consulted_at                  :datetime
#  comments                         :text
#  last_login_at                    :datetime
#  current_login_at                 :datetime
#  current_card_bin                 :string(6)
#  current_card_id                  :string(255)
#  expert_pick_eligible             :boolean          default(FALSE)
#

class Customer < ActiveRecord::Base
  has_one  :cart
  has_one  :facebook, :dependent => :destroy
  has_one  :fit, :dependent => :destroy
  has_one  :user_referral, :as => :user_referable, :dependent => :destroy
  has_one  :shipping_address, :as => :addressable, :class_name => "ShippingAddress", :dependent => :destroy
  has_one  :billing_address,  :as => :addressable, :class_name => "BillingAddress", :dependent => :destroy
  has_many :orders, :dependent => :destroy
  has_many :order_items, :through => :orders
  has_many :surveys, :through => :orders
  has_many :promo_codes, :dependent => :destroy
  has_many :customer_variants
  has_many :additional_variants, :through => :customer_variants, :source => :variant
  has_many :additional_feedback_variants, :through => :customer_variants, :source => :variant, :conditions => ['source = ?', :feedback]
  has_many :wishlists
  has_many :product_search_queries
  has_many :communications,   :inverse_of => :customer, :class_name => :CustomerCommunication, :dependent => :destroy
  has_many :pilot_features,   :inverse_of => :customer, :dependent => :destroy
  has_many :credits, :inverse_of => :customer, :class_name => :CustomerCredit, :dependent => :destroy
  has_many :item_notifications, :inverse_of => :customer, :foreign_key => :email, :primary_key => :email
end
