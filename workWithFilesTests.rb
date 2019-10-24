require 'rubygems'

describe File do
   context "When testing workWithFiles" do
     it "should create a file, write some text there and delete created file" do

     someText = "text text text text text"

     aFile = File.new("TestFile.txt", "w")
     expect(File.file?("TestFile.txt")).to be true

     aFile.syswrite(someText)
     aFile = File.open("TestFile.txt")
     content = aFile.sysread(100)
     expect(content).to eq someText

     File.delete("TestFile.txt")
     expect(File.file?("TestFile.txt")).to be false
   end
 end
end
