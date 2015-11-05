require_relative 'controllers/menu_controller'

# #4
menu = MenuController.new
# #5
system "clear"
puts "Welcome to AddressBloc!"
# #6
menu.main_menu

# Failures:
#
#   1) AddressBook#import_from_csv imports the 5th entry
#      Failure/Error: expect(entry.email).to eql "sussie@blocmail.com"
#      NameError:
#        undefined local variable or method `entry' for #<RSpec::ExampleGroups::AddressBook::ImportFromCsv:0x007fdb2201c390>
#      # ./spec/address_book_spec.rb:116:in `block (3 levels) in <top (required)>'
#
#   2) AddressBook#import_from_csv imports the 1st entry
#      Failure/Error: expect(entry.name).to eql expected_name
#
#        expected: "John"
#             got: "Jay"
#
#        (compared using eql?)
#      # ./spec/address_book_spec.rb:9:in `check_entry'
#      # ./spec/address_book_spec.rb:135:in `block (3 levels) in <top (required)>'
#
#   3) AddressBook#import_from_csv imports the 2nd entry
#      Failure/Error: expect(entry.name).to eql expected_name
#
#        expected: "Ron"
#             got: "John"
#
#        (compared using eql?)
#      # ./spec/address_book_spec.rb:9:in `check_entry'
#      # ./spec/address_book_spec.rb:146:in `block (3 levels) in <top (required)>'
#
#   4) AddressBook#import_from_csv imports the 3rd entry
#      Failure/Error: expect(entry.name).to eql expected_name
#
#        expected: "Jay"
#             got: "Ron"
#
#        (compared using eql?)
#      # ./spec/address_book_spec.rb:9:in `check_entry'
#      # ./spec/address_book_spec.rb:157:in `block (3 levels) in <top (required)>'
#
# Finished in 0.1318 seconds (files took 0.65344 seconds to load)
# 15 examples, 4 failures
#
