class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Receiving current_user error below when trying to Sign Up or User.create a new user.
  # validates_presence_of :time_zone, if: :current_user

  has_many :connections, dependent: :destroy

  private

  def user_time_zone(&block)
    Time.use_zone(current_user.time_zone, &block)
  end
end
