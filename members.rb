# frozen_string_literal: true

# attr_accessor :id, :name, :pending, :member_found

# methods for memebers 
class Members
  # loads the list of members
  def initialize
    m1 = { id: 1, name: 'bob', pending: 1 }
    m2 = { id: 2, name: 'Sally', pending: 0 }
    m3 = { id: 3, name: 'John', pending: 0 }
    m4 = { id: 4, name: 'Harry', pending: 0 }
    m5 = { id: 5, name: 'kevin', pending: 0 }
    @members_list = [m1, m2, m3, m4, m5]
  end

  # WHEN_2_VIEW_ALL_MEMBERS

  def view_all_members
    puts 'showing all members of the library'
    puts 'Pending_books' + ' ' + 'members'
    @members_list.each { |x| puts "#{x[:pending]}" + ' ' + "#{x[:name]}" }
  end

  def find_member
    # Ask Member_ID 
    puts 'enter member id'
    member_id = gets.chomp
    @member_found = @members_list.find { |member| member[:id] == member_id }
  end
end
