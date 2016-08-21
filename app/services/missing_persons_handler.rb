class MissingPersonsHandler

  def file_missing_person message, mobile_number
    details = message.split '/'

    Person.create(
      :full_name => details[0],
      :age => details[1],
      :sex => details[2],
      :location => details[3],
      :source_number => mobile_number,
      :found => false
    )
  end

end
