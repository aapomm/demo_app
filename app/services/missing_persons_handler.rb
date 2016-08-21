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

  def mark_person_as_found person
    person.update_attribute :found, true

    send_found_message person
  end



  private

  def send_found_message person
    TextSender.new(person.source_number).send_message(
      "Si #{person.full_name} ay natagpuan na po. Maari po lamang na sunduin " \
      "siya sa pinakamalapit na evacuation area."
    )
  end

end
