# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def token
    client_id = "client_id=#{Rails.application.credentials.client_id}"
    client_secret = "client_secret=#{Rails.application.credentials.client_secret}"
    secret_body = "#{client_id}&#{client_secret}&grant_type=client_credentials"
    HTTParty.post("https://us.battle.net/oauth/token", {
                                  body: secret_body,
                                  headers: {
                                    "Content-Type" => "application/x-www-form-urlencoded"
                                  }
                                }).parsed_response["access_token"]
  end
end
