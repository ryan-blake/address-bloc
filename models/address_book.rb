require_relative 'entry'
require "csv"

class AddressBook
  attr_accessor :entries

  def initialize
    @entries = []
  end

  # Search AddressBook for a specific entry by name
  def binary_search(name)
    return nil
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


  def import_from_csv(file_name)
    csv_text = File.read(file_name)
    csv = CSV.parse(csv_text, headers: true, skip_blanks: true)

    csv.each do |row|
      row_hash = row.to_hash
      add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
    end
  end


  def binary_search(name)
                        # The utility of this function is good for n names??
# #1
      lower = 0
      upper = entries.length - 1

# #2
    while lower <= upper
# #3
      mid = (lower + upper) / 2
      mid_name = entries[mid].name

# #4
    if name == mid_name
      return entries[mid]
    elsif name < mid_name
      upper = mid - 1
    elsif name > mid_name
      lower = mid + 1
    end
    end

# #5
  return nil
  end

  
end
