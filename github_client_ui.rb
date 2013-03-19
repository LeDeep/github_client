require './lib/gist'
require './lib/gistfile'
require 'faraday'
require 'json'
require 'base64'



def welcome
  puts "Welcome to the Github command-line client."
  login
end

def login
  puts "What is your Github username: "
  $github_username = gets.chomp
  puts "What is your Github password: "
  $github_password = gets.chomp
  menu
end

def menu
  choice = nil
  until choice == 'e'
    puts "What would you like to do?"
    puts "Press 'l' to list your Gists, 'c' to create a new Gist, 'v' to view a Gist, 'u' to update a Gist, or 'd' to delete a Gist."
    puts "Press 'e' to exit."

    case choice = gets.chomp
    when 'l'
      list
    when 'c'
      create
    when 'v'
      view
    when 'u'
      update
    when 'd'
      delete
    when 'e'
      exit
    else
      invalid
    end
  end
end

def create
  public_attribute = nil
  while public_attribute.nil?
    puts "Would you like this Gist to be public? Type 'y' or 'n'."
    public_attribute = gets.chomp
    case public_attribute
    when 'y'
      public_attribute = true
    when 'n'
      public_attribute = false
    else
      puts "That wasn't a valid choice."
    end
  end
  puts "Type a description for the Gist, or hit Enter for no description."
  description = gets.chomp
  puts "What would you like the name of the file in the Gist to be?"
  filename = gets.chomp
  puts "Now, type the content of the Gist:"
  content = gets.chomp
  files = {filename => {:content => content}}

  Gist.create(:public => public_attribute, :description => description, :files => files)
end

# def list
#   Gist.list
# end

def delete
  puts "What is the id of the gist you want to delete?"
  id = gets.chomp
  Gist.delete(id)
  puts "Gist #{id} has been deleted."
end

def edit
  choice = nil
  puts "What is the id of the gist you would like to edit?"
  id = gets.chomp
  puts "What would you like to edit? Press 1 to edit filename or 2 to edit description"
  case choice = gets.chomp
  when '1'
    puts "Please enter the new file name you would like for your gist:"
    file_name = gets.chomp
    Gist.edit_filename(id, file_name)
  when '2'
    puts "Please enter the new description you would like for your gist:"
    description = gets.chomp
    Gist.edit_description(id, description)
  else
    menu
  end
end

welcome