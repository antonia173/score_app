class Auth0Controller < ApplicationController
  def callback
    auth_info = request.env['omniauth.auth']
    session[:userinfo] = auth_info['extra']['raw_info']
    redirect_to root_url
  end

  def failure
    @error_msg = request.params['message']
  end

  def logout
    session[:userinfo] = nil

    request_params = {
      returnTo: root_url,
      client_id: Rails.application.credentials.auth0[:client_id]
    }
    url = URI::HTTPS.build(
      host: Rails.application.credentials.auth0[:domain], 
      path: '/v2/logout', 
      query: request_params.to_query
    ).to_s
    
    redirect_to url, allow_other_host: true
  end

end
