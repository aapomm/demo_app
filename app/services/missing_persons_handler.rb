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

  def mark_person_as_found person_id
    person = Person.find person_id
    person.update_attribute found, true

    TextSender.new(person_id.source_number).send_message(
      "Si #{person.full_name} ay natagpuan na po. Maari po lamang na sunduin " \
      "siya sa pinakamalapit na evacuation area."
    )
  end

end
