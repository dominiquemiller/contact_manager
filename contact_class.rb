class Contact
  attr_accessor :name, :company, :address, :city, :state, :zipcode, :email, :mobile
  @@contact_array = []

  def initialize(name = create_contact)
    @name = name
    @company = company
    @address = address
    @city = city
    @state = state
    @zipcode = zipcode
    @email = email
    @mobile = mobile
    @@contact_array << self
  end

  def create_contact
    puts "Ok, lets enter some information for your new contact!"
    sleep 1
    puts "Please enter your contacts name:"
      @name = gets.chomp
    puts "Please enter what company you contact works for:"
      @company = gets.chomp
    puts "Please enter the street address:"
      @address = gets.chomp
    puts "Please enter the city"
      @city = gets.chomp
    puts "Please enter the 2 letter state abbriviation:"
      @state = gets.chomp
    puts "Please enter the zip code:"
      @zip = gets.chomp.to_i
    puts "Please enter the contacts e-mail:"
      @email = gets.chomp
    puts "Please enter a mobile number for your contact:"
      @mobile = gets.chomp
  end

  def self.contact_delete(c)
    @@contact_array.delete_at(c)
  end

  def self.list
    i = 1
    @@contact_array.each do |contact|
      puts "#{i} - #{contact.name}"
      i += 1
    end
  end

  def self.all
    @@contact_array
  end

  def self.update(contact)
    puts "You chose to update #{contact.name}."
    puts <<-EOP
    What would you like to update?
    (N)ame
    (C)ompany
    (A)ddress
    (C)ity
    (S)tate
    (Z)ipcode
    (E)mail
    (M)obile

    EOP
    answer = gets.chomp.downcase

    case answer
    when "n"
      puts "please enter a new name:"
      contact.name = gets.chomp
    when "c"
      puts "please enter a new company:"
      contact.company = gets.chomp
    when "a"
      puts "please enter a new street address:"
      contact.address = gets.chomp
    when "c"
      puts "please enter a new city:"
    when "s"
      puts "please enter a new state:"
        contact.state = gets.chomp
    when "z"
      puts "please enter a new zipcode"
      contact.zipcode = gets.chomp
    when "e"
      puts "please enter a new e-mail:"
      contact.email = gets.chomp
    when "m"
      puts "please enter a new mobile number:"
      contact.mobile = gets.chomp
    else
      puts "I did not understand try again!"
      main_menu
    end
  end

  def self.import
    contacts = CSV.read('./contacts.csv')
    contact_count = 0
    contacts.each do |contact|
      if contact[0]
        new_contact = Contact.new(contact[0])
        new_contact.company = contact[1]
        new_contact.address = contact[2]
        new_contact.city = contact[3]
        new_contact.state = contact[4]
        new_contact.zipcode = contact[5]
        new_contact.email = contact[6]
        new_contact.mobile = contact[7]
      end
      contact_count += 1
    end
    puts "#{contact_count} imported!"
  end

  def self.show(contact)
    puts "#{contact.name}"
    puts "#{contact.address}  #{contact.city}, #{contact.state} #{contact.zipcode}"
    puts "#{contact.email}"
    puts "#{contact.mobile}"
  end

end
