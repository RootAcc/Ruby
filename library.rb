# frozen_string_literal: true

load 'books.rb'
load 'members.rb'

# This is the main library program

# Contains all methods for library
class Library
  attr_accessor :id, :title, :author, :issued_by, :member_name

  # INITIALIZING the program
  # def initialize
  #  this method is shifted to books and members rb files
  # end

  def start
    # standerd welcome message in puts
    welcome_guide
    # CHOOSE the option to execute
    @books = Books.new
    @members = Members.new
    loop do
      puts 'Enter an option'
      option = gets.chomp.to_i
      puts "entered option: #{option}"
      case option
      when 0
        puts 'Enter valid option'
      when 1
        # VIEWING_ALL_BOOKS
        @books.view_all_books
      when 2
        # VIEWING_ALL_MEMBERS
        @members.view_all_members
      when 3
        # ISSSUING_BOOK
        @members.find_member
        @books.issue_books
        @book_found[:issued_by] = @found_member[:name]

      when 4
        # CHECK_BOOK_AVAILABILTY
        @books.book_avail
      when 5
        # RETURN_BOOK
        @books.return_books
      when 6
        # ADD_BOOK
        @books.add_book
      end
      break if option >= 7
    end
    puts 'exiting library'
  end

  # WHEN_3_ISSUING_BOOK
  def welcome_guide
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
  end
end
