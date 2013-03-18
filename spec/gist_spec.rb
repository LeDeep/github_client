require 'spec_helper'

describe Gist do 

  gist = {:public => 'true', :description => 'a test gist'}

  context '.create' do 
    it 'Posts a new Gist to the user\'s account' do 
      stub = stub_request(:post, "https://#{$github_username}:#{$github_password}@api.github.com/gists").with(:body => gist.to_json)
      Gist.create(gist)
      stub.should have_been_requested
    end

    
  context '#initialize'
    it 'returns an instance of a gist object' do
      Gist.new(gist).should be_an_instance_of Gist
    end 
  end

 
  context '#public_status' do 
    it 'returns true if gist is public' do 
      gist = {:public => 'true', :description => 'a test gist'}
      gist_file = Gist.new(gist)
      gist_file.public_status.should be_true
     end
  end


  context '#description' do 
    it 'returns the description for a gist' do
      gist = {:public => 'true', :description => 'a test gist'}
      gist_file = Gist.new(gist)
      gist_file.description.should eq 'a test gist'
    end
  end


  context '.list' do
    # it 'Lists all the gist objects' do 

    #   Gist.list
        
    # end
  end

  context '.delete' do
    it 'deletes a users gist' do
      id = 5191656
      stub = stub_request(:delete, "https://api.github.com/gists/#{id}")
      Gist.delete(id)
      stub.should have_been_requested
    end
  end

end