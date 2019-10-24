aFile = File.new("TestFile.txt", "w")
if aFile
   aFile.syswrite("some text")
else
   puts "File not exists!"
end

aFile = File.open("TestFile.txt")
if aFile
   content = aFile.sysread(100)
   puts content
   File.delete("TestFile.txt")
else
   puts "File not exists!"
end
