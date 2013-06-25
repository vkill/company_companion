class Client::SessionsController < Devise::SessionsController

  layout 'client_devise'

  private

  def after_sign_in_path_for(record)
    client_root_path
  end

  def after_sign_out_path_for(record)
    client_root_path
  end

end
