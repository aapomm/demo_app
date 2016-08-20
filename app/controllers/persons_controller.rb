class PersonsController <  ApplicationController


  def index
    @persons = Person.all
  end

  def search
    @persons = Person.fulltext_search(params[:query]).records
  end

end
