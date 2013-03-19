class Gist
 attr_reader :description, :public_status


  def initialize(attributes)
    @public_status = attributes[:public]
    @description = attributes[:description]
  end

  def self.create(options)
    post_response = Faraday.post do |request|
      request.url 'https://api.github.com/gists'
      request.headers['Authorization'] = "Basic " + Base64.encode64("#{$github_username}:#{$github_password}")
      request.body = options.to_json
    end
  end

  def self.list_file(username)
    response = Faraday.get "https://api.github.com/users/#{username}/gists"
    p response
    gists = JSON.parse(response.body)
    p gists
    gist_files = gists.map {|gist| gist['files']}
    p gist_files
    gist_name = gist_files.each {|file| puts file.keys}
  end



  def self.delete(id)
    delete_response = Faraday.delete do |request|
      request.url "https://api.github.com/gists/#{id}"
      request.headers['Authorization'] = "Basic " + Base64.encode64("#{$github_username}:#{$github_password}")
    end
  end

  def self.edit_filename(id, user_input)
    patch_response = Faraday.patch do |request|
      request.url "https://api.github.com/gists/#{id}"
      request.headers['Authorization'] = "Basic " + Base64.encode64("#{$github_username}:#{$github_password}")
      request.body = '{ "filename": "#{user_input}" }'
    end
  end

  def self.edit_description(id, user_input)
    patch_response = Faraday.patch do |request|
      request.url "https://api.github.com/gists/#{id}"
      request.headers['Authorization'] = "Basic " + Base64.encode64("#{$github_username}:#{$github_password}")
      request.body = '{ "description": "#{user_input}" }'
    end
  end


end
