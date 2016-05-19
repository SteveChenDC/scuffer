class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :time_zone, if: :current_user

  private

  def user_time_zone(&block)
    Time.use_zone(current_user.time_zone, &block)
  end
end
