require_relative 'entry'

class AddressBook
 attr_accessor :entries

 def initialize
   @entries = []
end


def remove_entry(name, phone_number, email)
   deleted_entry = nil

   @entries.each do |entry|
     if name == entry.name && phone_number == entry.phone_number && email == entry.email
       deleted_entry = entry
     end
   end
   @entries.delete(deleted_entry)

end


def add_entry(name, phone_number, email)

 index = 0
 @entries.each do |entry|

   if name < entry.name
     break
   end
   index += 1
end

  @entries.insert(index, Entry.new(name, phone_number, email))
 end
end
