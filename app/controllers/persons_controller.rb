class PersonsController <  ApplicationController


  def index
    @persons = Person.missing
  end

  def search
    @persons = Person.fulltext_search(params[:query]).records.order :found
  end

  def autocomplete
    @persons = Person.fulltext_search(params[:q]).records.pluck :full_name

    render :json => @persons
  end

  def set_as_found
    @person = Person.find params[:id]
    @person.update_attribute :found, true

    send_found_message

    redirect_to :persons
  end



  protected

  def send_found_message
    TextSender.new(@person.source_number).send_message(
      "Si #{@person.full_name} ay natagpuan na po. Maari po lamang na tumawag " \
      "sa hotline numbers na +632-9125668, +632-9111406, o +632-9115061 at " \
      "makipagcoordinate sa NDCC upang makumpirma kung siya nga."
    )
  end

end
