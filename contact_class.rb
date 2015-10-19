class Contact
  attr_accessor :name, :company, :address, :city, :state, :zipcode, :email, :mobile

  def initialize
    @new = create_contact
    @name = name
    @company = company
    @address = address
    @city = city
    @state = state
    @zipcode = zipcode
    @email  = email
    @mobile = mobile
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
      @zip = gets.chomp
    puts "Please enter the contacts e-mail:"
      @email = gets.chomp
    puts "Please enter a mobile number for your contact:"
      @mobile = gets.chomp
  end

  def self.list
    if ObjectSpace.each_object(self).to_a.empty?
      puts "Sorry you have nothing to display!"
    else
      i = 1
      ObjectSpace.each_object(self).to_a.each do |contact|
        puts "#{i} - #{contact.name}"
        i += 1
      end
    end
  end

  def self.all
    ObjectSpace.each_object(self).to_a
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



end
