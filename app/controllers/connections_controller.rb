class ConnectionsController < ApplicationController

  before _action :set_connection, only: [:destroy]

  def create
    connection = current_user.connections.create_from_omniauth(auth_hash)
    if connection.save
      redirect_to dashboard_path, notice: "Connection Created!"
    else
      redirect_to dashboard_path, notice: "Somethign went wrong!"
    end
  end

  def destroy
    @connection.destroy
    redirect_to dashboard_path, notice: "Connection Deleted"
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

  def set_connection
    @connection = Connection.find(params[:id])
  end
end
