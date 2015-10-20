require_relative "contact_class"
require "csv"

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
                       (S)how contacts
                       (D)elete contact
                        (N)ew contact
                            (Q)uit


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
      list_contacts
    when "q"
      exit
    when "s"
      show
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
  Contact.list
  puts "Enter the number of the contact to update."
  answer = gets.chomp.to_i
  Contact.update(Contact.all[answer - 1])
  main_menu
end

def show
  Contact.list
  puts "Enter the number of contact to show"
  answer = gets.chomp.to_i
  Contact.show(Contact.all[answer - 1])
  main_menu
end

def delete_contact
  Contact.list
  puts "Enter the number of the contact to delete."
  answer = gets.chomp.to_i
  c = answer - 1
  Contact.contact_delete(c)
  puts  "You have deleted your contact!"
  main_menu
end

def list_contacts
  Contact.list
  main_menu
end

def import_csv
  Contact.import
  main_menu
end

def export_csv

  CSV.open("myfile.csv", "w") do |csv|
  csv << ["name", "company", "address", "city", "state", "zipcode", "email", "mobile"]
  Contact.all.each do |contact|
    a = contact.name, contact.company, contact.address, contact.city, contact.state, contact.zipcode, contact.email, contact.mobile
    csv << a
    end
  end
  main_menu
end

start
