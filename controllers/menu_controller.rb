require_relative '../models/address_book'

class MenuController
  attr_accessor :address_book

  def initialize
    @address_book = AddressBook.new
  end
## ch.23

def delete_entry(entry)
    @address_book.entries.delete(entry)
    puts "#{entry.name} has been deleted"
  end

def edit(entry)
  print "updated name: "
  name = gets.chomp
  print "updated phone number: "
  phone_number = gets.chomp
  print "updated email: "
  email = gets.chomp

  entry.name = name if !name.empty?
  entry.phone_number = phone_number if !phone_number.empty?
  entry.email = email if !email.empty?
  system "clear"

  puts "Updated entry"
  puts entry
end


  def main_menu
# #2
    puts "Main Menu - #{@address_book.entries.count} entries"
    puts "1 - View all entries"
    puts "2 - Create an entry"
    puts "3 - Search for an entry"
    puts "4 - Import entries from a CSV"
    puts "5 - Search for entry by number"
    puts "6 - annihilate all entries"
    puts "7 - Exit"
    print "Enter your selection: "

# #3
    selection = gets.to_i
    puts "You picked #{selection}"


    case selection

    when 1
      system "clear"
      view_all_entries
      main_menu


    when 2
      system "clear"
      create_entry
      main_menu

    when 3
      system "clear"
      search_entries
      main_menu

    when 4
      system "clear"
      read_csv
      main_menu

    when 5
      system "clear"
      entry_by_n
      main_menu

    when 6
      system "clear"
      annihilate
      main_menu


    when 7
      puts "good-bye!"

      exit(0)

    else
      system "clear"
      puts "Sorry, that is not a valid input"
      main_menu
    end
  end


  def view_all_entries

    @address_book.entries.each do |entry|
      system "clear"
      puts entry.to_s

      entry_submenu(entry)
  end

  system "clear"
  puts "End of entries"
end

def entry_submenu(entry)

  puts "n - next entry"
  puts "d - delete entry"
  puts "e - edit this entry"
  puts "m - return to main menu"

  selection = gets.chomp

  case selection

  when "n"
  when "d"
    delete_entry(entry)
  when "e"
    edit_entry(entry)
    entry_submenu(entry)
  when "m"
    system "clear"
    main_menu
  else
    system "clear"
    puts "#{selection} is not a valid input"
    entries_submenu(entry) # entry_submenu(entry) ??
  end
 end


  def create_entry
    system "clear"
    puts "New AddressBloc Entry"

    print "Name: "
    name = gets.chomp
    print "Phone number: "
    phone_number = gets.chomp
    print "Email: "
    email = gets.chomp

    @address_book.add_entry(name, phone_number, email)

    system "clear"
    puts "New entry created"
  end

  def entry_by_n
    system "clear"
    puts "enter the number ID for entry"
    selection = gets.chomp.to_i

    if selection < @address_book.entries.count
      puts @address_book.entries[selection]
      puts "Press enter to return to main menu"
      gets.chomp
      system "clear"
    else
      puts "#{selection} is not valid"
      entry_by_n
  end

  def search_submenu(entry)
    puts "\nd - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"


    selection = gets.chomp

    case selection
    when "d"
      system "clear"
      delete_entry(entry)
      main_menu
    when "e"
      edit_entry(entry)
      system "clear"
      main_menu
    when "m"
      system "clear"
      puts "#{selection} is not a valid input"
      puts entry.to_s
      search_submenu(entry)
    end
end


  def read_csv
  end
end
