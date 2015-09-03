#!/usr/bin/env ruby

# YOUR CODE HERE

require 'pry'
require_relative 'card'
require_relative 'deck'
require_relative 'hand'

puts "\nWelcome to Blackjack!\n\n"

deck = Deck.new()
deck.shuffle

player_hand = Hand.new("Player", deck.deal, deck.deal)
dealer_hand = Hand.new("Dealer", deck.deal, deck.deal)

while player_hand.score < 21
  puts "\nPlayer Score: #{player_hand.score}\n\n"
  puts "Hit or Stand (H/S): "
  player_action = gets.chomp
  if player_action.downcase == "h"
    player_hand.hit(deck.deal)
  elsif player_action.downcase == "s"
    break
  else
    puts "Please choose either hit (H/h) or stand (S/s): "
  end
end

puts

if player_hand.bust?
  puts "Bust! You lose..."
elsif player_hand.score == 21
  puts "You win!"
else
  puts "\nDealer Score: #{dealer_hand.score}"
end

if !player_hand.bust? && player_hand.score < 21
  while dealer_hand.score < 17 && !dealer_hand.bust?
    dealer_hand.hit(deck.deal)
    puts "\nDealer Score: #{dealer_hand.score}"
  end

  if dealer_hand.bust?
    puts "Dealer busts! You win..."
  elsif dealer_hand.score > player_hand.score
    puts "Dealer wins!"
  elsif dealer_hand.score < player_hand.score
    puts "You win!"
  else
    puts "Tie!"
  end
end
