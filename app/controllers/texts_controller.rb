class TextsController < ApplicationController

  def file_missing
    response =
      TextSender.new(params[:mobile_number]).send_reply(
        'You have successfully filed a missing person.',
        params[:request_id]
      )

    puts response

    render :nothing => true, :status => 200
  end

end
