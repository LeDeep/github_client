require 'spec_helper'


describe GistFile do 

  files = [{'test_file.rb' => {:content => 'puts "Mike likes v-necks a lot."'}}]

  context '#initialize' do
    it 'is initialized with a hash of attributes' do
      file_hash = {'test_file.rb' => {:content => 'puts "Mike likes v-necks a lot."'}}
      GistFile.new(file_hash).should be_an_instance_of GistFile
    end
  end


  context '#name' do
    it 'returns the name of the gist file' do
      file_hash = {'test_file.rb' => {:content => 'puts "Mike likes v-necks a lot."'}}
      gist_file = GistFile.new(file_hash)
      gist_file.name.should eq 'test_file.rb'
    end
  end


  context '#content' do
    it 'returns the content from the gist file' do
      file_hash = {'test_file.rb' => {:content => 'puts "Mike likes v-necks a lot."'}}
      gist_file = GistFile.new(file_hash)
      gist_file.content.should eq 'puts "Mike likes v-necks a lot."'
    end
  end

end