class MatchesController < ApplicationController
    before_action :set_offer_and_request
  
    def create
      @match = Match.new(match_params)
  
      if @match.save
        send_whatsapp_message(@request.user.phone, "¡Hola! Tienes una nueva postulación para tu solicitud.")
        redirect_to root_path, notice: "Postulación enviada."
      else
        redirect_to root_path, alert: "No se pudo enviar la postulación."
      end
    end
  
    private
  
    def set_offer_and_request
      @offer = ProductOffer.find(params[:id])
      @request = Request.find_by(id: params[:request_id]) || Request.last
    end
  
    def match_params
      {
        request: @request,
        product_offer: @offer,
        status: "pending"
      }
    end
  
    def send_whatsapp_message(to_phone, message_body)
      account_sid = ENV['TWILIO_ACCOUNT_SID']
      auth_token = ENV['TWILIO_AUTH_TOKEN']
      client = Twilio::REST::Client.new(account_sid, auth_token)
  
      client.messages.create(
        from: 'whatsapp:+14155238886',
        to: "whatsapp:#{to_phone}",
        body: message_body
      )
    end
  end