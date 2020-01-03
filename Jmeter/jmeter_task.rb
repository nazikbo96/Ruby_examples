require 'rubygems'
test do
  threads count: 10 do
    visit name: 'Google Search', url: 'https://flooded.io'
  end
end.flood('tosca_live_0f5b90b56ce49376836d8f819116217b1aaebc76e6cad805c641ddbe2fd1486e')
