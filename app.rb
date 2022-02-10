# local module imports
require_relative "utils"
include Utils

# imports
require 'net/http'
require 'uri'
require 'json'

# class with methods
class Book
    attr_accessor :title, :author, :pages, :current_page
    def initialize title, author, pages
        @title = title
        @author = author
        @pages = pages
        @current_page = 0
    end
    def turn_page(num_of_pages)
        @current_page += num_of_pages 
    end
    def print_name name
        puts name
    end
end

# inhiterance
class SchoolBook < Book
    attr_accessor :grade
    def initialize grade, title, author, pages
        super(title, author, pages)
        @grade = grade
    end
end

# loops
math_book = SchoolBook.new("Math", "Math for Dummies", "Dummy", 300)
for num in 0..4
    math_book.turn_page(1)
end

# OOP
puts math_book.pages
puts math_book.current_page
# getting functions from other modules
puts pages_until_end(math_book.pages, math_book.current_page)

# http request
uri = URI('http://localhost:3000/person')
res = Net::HTTP.get_response(uri)
object = JSON.parse(res.body, object_class: OpenStruct) # converts json into object
puts object[0].name if res.is_a?(Net::HTTPSuccess)

puts Utils::CONSTANT # Unary operator