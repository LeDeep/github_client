class GistFile
  attr_reader :name, :content 

  def initialize(attributes)
    @name = attributes.keys.first
    @content = attributes.values.first.values.first
  end

  # def name
  #   response = Faraday.get "https://api.github.com/users/$github_username/gists"
  #   gists = JSON.parse(response.body)
  #   gist_files = gists.map {|gist| gist['files']}
  # end



  # def self.list_file_name(name)
  #   response = Faraday.get "https://api.github.com/users/$github_username/gists"
  #   gists = JSON.parse(response.body)
  #   gist_files = gists.map {|gist| gist['files']}
  #   gist_name = gist_files.each {|file| puts file.keys}
  # end



  # def files
  #   response = Faraday.get "https://api.github.com/users/$github_username/gists"
  #   gists = JSON.parse(response.body)    
  #   gist_files = gists.map {|gist| gist['files']}
  #   p gist_files
  # end
end