# frozen_string_literal: true
# load 'book.rb'
# This is the main library program
class Library
  attr_accessor :id, :title, :author, :issued_by, :member_name
  # INITIALIZING the program 
  def initialize
    # this method creates the hashes required for Library
    b1 = { id:'1', title: 'voices from the sea', author: 'Alex Thompson', issued_by: 'bob' }
    b2 = { id:'2', title: 'You can You will', author: 'Arfeen Khan', issued_by: ''}
    b3 = { id:'3', title: 'advanced learning ', author: 'LearnApt', issued_by: ''}
    b4 = { id:'4', title: 'Water-what can you do ', author: 'Glen Murphy', issued_by:'' }
    b5 = { id:'5', title: 'Animator Survival ', author: 'Richard Williams', issued_by: ''}
    @bookrack = [b1, b2, b3, b4, b5]
    m1 = { id: '1', name: 'bob', pending: 1}
    m2 = { id: '2', name: 'Sally', pending: 0}
    m3 = { id: '3', name: 'John', pending: 0}
    m4 = { id: '4', name: 'Harry', pending: 0}
    m5 = { id: '5', name: 'kevin', pending: 0}
    @members = [m1, m2, m3, m4, m5]
  end

  def start
    # standerd welcome message in puts
    puts '-------'
    puts "Welcome to world's best library. Choose an option."
    puts '-------'
    puts '1. View all books.'
    puts '2. View all members.'
    puts '3. Issue book to a member.'
    puts '4. Check book availability.'
    puts '5. Accept book returned by a member.'
    puts '6. Add book.'
    puts '7. EXIT'
    # CHOOSE the option to execute
    loop do
      puts"Enter an option "
      option = gets.chomp.to_i
      puts "entered option: #{option}"
      case option
        when 0
          puts"Enter valid option"
        when 1
          # VIEWING_ALL_BOOKS 
          view_all_books
        when 2
          # VIEWING_ALL_MEMBERS 
          view_all_members
        when 3
          # ISSSUING_BOOK 
          issue_books
        when 4
          # CHECK_BOOK_AVAILABILTY
          book_avail
        when 5
          # RETURN_BOOK
          return_books
        when 6
          # ADD_BOOK
          add_book
        else
      end
      break if  option >=7
    end
    puts ('exiting library')  
  end
  # Book_check
  def book_check
    puts 'enter book-id'
    # Get the id of book 
    id = gets.chomp.to_i
    @bookrack.each do |book|
      if book[:id] == id.to_s
        puts "book is present "
      else
      end
    end   
  end  
  # WHEN_1_VIEW_ALL_BOOKS
  def view_all_books
    puts 'showing all books in the library'
    puts 'ID' + '  ' + 'Name' + '               ' + 'Issued'
    @bookrack.each { |book| puts "#{book[:id]}" + '.  ' + "#{book[:title]}" + '.   ' + " #{book[:issued_by]}" }
  end

  # WHEN_2_VIEW_ALL_MEMBERS
  def view_all_members
    puts 'showing all members of the library'
    puts"Pending_books"+" "+"members"
    @members.each { |x| puts "#{x[:pending]}"+"  "+"#{x[:name]}" }
  end

  # WHEN_3_ISSUING_BOOK
  def issue_books
    # Ask Member_ID 
    puts 'enter member id'
    idm = gets.chomp.to_s
    @members.each do |member|
      if member[:id] == idm.to_s
        puts" member found : #{member[:name]}"
        # Ask book_ID to assign
        puts 'enter book-id '
        id= gets.chomp.to_i
        @bookrack.each do |book|
        if book[:id] == id.to_s
          book[:issued_by]=member[:name]
          puts "#{book[:title]} is issued by  #{book[:issued_by]}"
        end 
        end 
        @members.each do |member|
          if member[:id] == idm.to_s
            member[:pending]+= 1  
          end
        end
      end
    end  
  end

  # WHEN_4_BOOK_AVAIL
  def book_avail
    book_check
      puts " book is available in library  "
  end    

  # WHEN_5_RETURN_BOOK
  def return_books
    # Check if book exists 
    puts 'enter book-id'
    # Get the id of book 
    id = gets.chomp.to_i
    @bookrack.each do |book|
      if book[:id] == id.to_s
        puts "book is present "
      else
      end
    end   
    # Check if the book is issued 
    puts 'enter member name '
    # Get the member name
    mem = gets.chomp.to_s
    @bookrack.each do |book|
      if book[:isssed_by] == mem.to_s
        puts "book is issued to #{mem}" 
      end
    end 
    @bookrack.each do |book|
      if book[:id] == id.to_s
        book[:issued_by]=" "
        @members.each do |member|
          if member[:id] == mem.to_s
          member[:pending]-= 1
          end  
        end
        puts "#{book[:title]} is returned"  
      end
    end
  end

  # WHEN_6_ADD_NEW_BOOK
  def add_book
    puts 'enter new book ID '
    id = gets.chomp.to_i
    if id > @bookrack.length
      puts 'enter book name '
      title = gets.chomp.to_s
      puts 'enter book author'
      author = gets.chomp.to_s
      book_hash = { id: id, title: title, author: author, issued_by: ' ' }
      # Add new book in the bookrack
      @bookrack.push book_hash
        @bookrack.each do |book|
          if book[:id] == id.to_s 
          puts "A new book is added : #{book[:id]}"+" #{book[:title]}"+".written by ."+"#{book[:author]}"
          end
        end
    else
      puts " book id already exist, try more than 5"  
    end
  end
end

# Creates an isntance of a class
library = Library.new
# Calls the method Start
library.start
