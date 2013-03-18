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

  def self.list
    get_response = Faraday.get do |request|
      request.url 'https://$github_username:$github_password@api.github.com/gists'
    end
  end

  def self.delete(id)
    delete_response = Faraday.delete do |request|
      request.url "https://api.github.com/gists/#{id}"
      request.headers['Authorization'] = "Basic " + Base64.encode64("#{$github_username}:#{$github_password}")
    end


  end


end
