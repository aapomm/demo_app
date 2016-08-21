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

    MissingPersonsHandler.new.mark_person_as_found @person

    redirect_to :persons
  end

end
