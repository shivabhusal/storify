class AuthyController < ApplicationController
  # Before we allow the incoming request to callback, verify
  # that it is an Authy request
  before_filter :authenticate_authy_request, :only => [:callback]
  skip_before_action :authenticate_user!, :only => [:callback]

  protect_from_forgery except: [:callback, :send_token]

  # The webhook setup for our Authy application this is where
  # the response from a OneTouch request will come
  def callback
    authy_id = params[:authy_id]
    begin
      @user = User.find_by! authy_id: authy_id
      @user.update(authy_status: params[:status])
    rescue => e
      puts e.message
    end
    render plain: 'OK'
  end

  def one_touch_status
    render plain: current_user.authy_status
  end

  def send_token_via_sms
    Authy::API.request_sms(id: current_user.authy_id)
    render js: "$.showFlashMessage('Verification token has been sent to your mobile device', 'info');"
  end

  # Authenticate that all requests to our public-facing callback is
  # coming from Authy. Adapted from the example at
  # https://docs.authy.com/new_doc/authy_onetouch_api#authenticating-callbacks-from-authy-onetouch
  private
  def authenticate_authy_request
    url           = request.url
    raw_params    = JSON.parse(request.raw_post)
    nonce         = request.headers["X-Authy-Signature-Nonce"]
    sorted_params = (Hash[raw_params.sort]).to_query

    # data format of Authy digest
    data          = nonce + "|" + request.method + "|" + url + "|" + sorted_params

    digest           = OpenSSL::HMAC.digest('sha256', Authy.api_key, data)
    digest_in_base64 = Base64.encode64(digest)

    theirs = (request.headers['X-Authy-Signature']).strip
    mine   = digest_in_base64.strip

    unless theirs == mine
      render plain: 'invalid request signature'
    end
  end
end