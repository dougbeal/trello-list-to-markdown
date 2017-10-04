require 'trello'
load 'foolscap-secret/trello.rb'
require 'pp'
require 'ap'
require 'pathname'

#me = Trello::Member.find("me")
path = Pathname.new('output')
path.mkdir if not path.exist?

# 54f7d5e278b19c12650c06a3  - Convention Tasks
boardid = "54f7d5e278b19c12650c06a3"
board = Trello::Board.find(boardid)
board.lists.each do |list|
  if list.name =~ /[mM]eeting/
    filename = "#{list.id} - #{list.name}"
    File.open(path.join("#{filename}.md"), 'w') { |f|
      f.puts "# #{list.id} - #{list.name}"
      list.cards( :members => true ).each do |card|
        member_string = card.members.map {|member| member.username }.join(",")
        f.puts "## #{card.name} [#{member_string}]"
        f.puts "#{card.desc}" if card.desc
        card.actions(:filter => "commentCard").each do |action|
          f.puts "* #{action.data["text"]}"
        end
      end
    }
  end
end



