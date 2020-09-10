# frozen_string_literal: true

# contains methods for books
# must be included in main.rb file

# attr_accessor :id, :title, :author, :issued_by, :book_found


class Books
  def initialize
    b1 = { id: 1, title: 'voices from the sea', author: 'Alex Thompson', issued_by: 'bob' }
    b2 = { id: 2, title: 'You can You will', author: 'Arfeen Khan', issued_by: '' }
    b3 = { id: 3, title: 'advanced learning ', author: 'LearnApt', issued_by: '' }
    b4 = { id: 4, title: 'Water-what can you do ', author: 'Glen Murphy', issued_by: '' }
    b5 = { id: 5, title: 'Animator Survival ', author: 'Richard Williams', issued_by: '' }
    @bookrack = [b1, b2, b3, b4, b5]
  end

  # WHEN_1_VIEW_ALL_BOOKS
  def view_all_books
    puts 'showing all books in the library'
    puts 'ID' + '  ' + 'Name' + '               ' + 'Issued'
    @bookrack.each { |book| puts "#{book[:id]}" + '.  ' + "#{book[:title]}" + '.   ' + " #{book[:issued_by]}" }
  end

  def issue_books

    find_book
    

    
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

  # WHEN_4_BOOK_AVAIL
  def book_avail
    book_check
      puts " book is available in library  "
  end

  def find_book
    # Ask book_ID to assign
    puts 'enter book-id '
    id = gets.chomp
    @book_found = @bookrack.find { |book| book[:id] == id }
  end
end
