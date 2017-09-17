class TwilioController < ApplicationController
  # skip_before_action :verify_authenticity_token

  def voice
    # response = Twilio::TwiML::Response.new do |r|
    #   r.Say "Yay! You're on Rails!", voice: "alice"
    #   r.Sms "Well done building your first Twilio on Rails 5 app!"
    #   r.Play "http://linode.rabasa.com/cantina.mp3"
    # end
    response = Twilio::TwiML::VoiceResponse.new
    response.say('Tell me how you\'re feeling')
    # response.play(url: 'https://api.twilio.com/Cowbell.mp3')
    response.record(timeout: 10, transcribe: true)

    render :xml => response.to_xml
  end

  def sms
    response = Twilio::TwiML::MessagingResponse.new
    response.message do |message|
        message.body('Thanks for telling me how you feel.')
    end
    render :xml => response.to_xml
  end
end
