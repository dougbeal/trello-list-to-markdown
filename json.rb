require 'trello'
load 'foolscap-secret/trello.rb'
require 'pp'
require 'ap'

#me = Trello::Member.find("me")

# 54f7d5e278b19c12650c06a3  - Convention Tasks
boardid = "54f7d5e278b19c12650c06a3"
board = Trello::Board.find(boardid)
board.lists.each do |list|
  if list.name =~ /[mM]eeting/
    puts "# #{list.id} - #{list.name}"
    list.cards( :members => true ).each do |card|
      member_string = card.members.map {|member| member.username }.join(",")
      puts "## #{card.name} [#{member_string}]"
      puts "#{card.desc}" if card.desc
      card.actions(:filter => "commentCard").each do |action|
        puts "* #{action.data["text"]}"
      end
    end

  end
end



