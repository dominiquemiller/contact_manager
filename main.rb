require_relative "contact_class"

def start
  puts <<-EOP
  ************************************************************
  //               Wynocde Contact Manager                  //
  ************************************************************

  EOP

  main_menu
end

def main_menu

  puts <<-EOP
                   What are we doing today?
                    (I)mport your CSV file
                    (E)xport your contacts
                       (U)pdate contact
                       (L)ist contacts
                       (D)elete contact
                        (N)ew contact


  EOP

  answer = gets.chomp.downcase

  case answer
    when "i"
      import_csv
    when "e"
      export_csv
    when "u"
      update
    when "d"
      delete_contact
    when "n"
      create
    when "l"
      Contact.list
    else
      puts "Sorry I did not understand that!"
      main_menu
  end
end

def create
  new_contact = Contact.new
  puts "Thank you! #{new_contact.name} was created successfully!"
  sleep 1
  main_menu
end

def update
  puts "Enter the number of the contact to update."
  Contact.list
  answer = gets.chomp.to_i
  Contact.update(Contact.all[answer - 1])
  main_menu
end



start
