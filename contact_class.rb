class Contact
  attr_accessor :name, :company, :address, :city, :state, :zipcode, :email, :mobile, :github_user
  @@contact_array = []

  def initialize(name, company, address, city, state, zipcode, email, mobile, github_user)
    @name = name
    @company = company
    @address = address
    @city = city
    @state = state
    @zipcode = zipcode
    @email = email
    @mobile = mobile
    @github_user = github_user
    @@contact_array << self
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
        name = contact[0]
        company = contact[1]
        address = contact[2]
        city = contact[3]
        state = contact[4]
        zipcode = contact[5]
        email = contact[6]
        mobile = contact[7]
        github_user = contact[8]
        Contact.new(name, company, address, city, state, zipcode, email, mobile, github_user)
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

  def self.github_lookup(contact)
    user = contact.github_user
    response = HTTParty.get("https://api.github.com/users/#{user}")
    body = JSON.parse response.body
    puts "My GitHub id is #{body['id']}"
  end

end
