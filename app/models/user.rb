class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  validates :phone_number, presence: true
  validates :country_code, presence: true
  validates :email, presence: true, uniqueness: true, exclusion: { in: %w(admin superuser) }

  has_many :orders
  has_many :products, through: :orders

  Roles = [ :admin , :default ]

  def admin?
  	self.role == 'admin'
  end

  def generate_pin
    self.otp = rand(0000..9999).to_s.rjust(4, "0")
    save
  end
  
  def send_pin
    begin
      phnumber = "+" + country_code + phone_number unless country_code.match("\\+")
      puts "otp: #{otp}"
      twilio_client.messages.create( to: phnumber, from: ENV['TWILIO_NUMBER'], body: "Your PIN is #{otp}")
    rescue Exception => e
      puts e.message
    end
  end
   
  def twilio_client
    Twilio::REST::Client.new(ENV['TWILIO_KEY'], ENV['TWILIO_TOKEN'])
  end

  def verify(entered_pin)
    if self.otp == entered_pin
      update_columns(otp_verified: true)
    end
  end
end
