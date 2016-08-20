class TextsController < ApplicationController

  def file_missing
    file_missing_person

    send_success_reply

    render :nothing => true, :status => 200
  end



  private

  def file_missing_person
    MissingPersonsHandler.new.file_missing_person(
      params[:message],
      params[:mobile_number]
    )
  end

  def send_success_reply
    reply_message =
      'Maraming salamat at natanggap na namin ang inyong report. Maari po ' \
      'lamang na hintayin ninyo ang resulta ng aksyon ng mga otoridad. ' \
      'Ginagawa po nila ang lahat ng makakakaya.'

    TextSender.new(params[:mobile_number]).send_reply(
      reply_message,
      params[:request_id]
    )
  end

end
