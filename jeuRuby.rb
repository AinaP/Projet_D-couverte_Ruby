def start # Début de la définition d'une fonction avec "def" + le nom de la fonction 
  puts "You are in a dark room." # OUTPUT on affiche le texte en guillements + retour chariot
  puts "There is a door to your *RIGHT* and *LEFT*."
  puts "Which one do you take ?"
  
  print "> " # OUTPUT on affiche le texte entre guillemets
  choice = $stdin.gets.chomp # Ligne pour entrer un paramètre via l'INPUT
  
  if choice == "left" # Début du bloc condition
    bear_room
  elsif choice == "right"
    cthulhu_room
  else
    dead("You stumble around the room until you starve.") # On appelle la fonction dead avec comme argument la string
  end # Fin du bloc condition
end # Fin de la fonction

def bear_room
  puts "There is a bear here."
  puts "The bear has a bunch of honey."
  puts "The fat bear is in front of another door."
  puts "How are you going to move the bear ? Do you *TAKE the HONEY*, *TAUNT the BEAR* or *OPEN the DOOR* ?"
  bear_moved = false
  
  while true # Début du bloc boucle, ici une boucle sans condition d'arrêt originelle 
    print "> "
    choice = $stdin.gets.chomp
    
    if choice == "take honey"
      dead("The bear looks at you then slaps your off.")
    elsif choice == "taunt bear" && !bear_moved
      puts "the bear has moved from the door. You can go through it now."
      bear_moved = true
    elsif choice == "taunt bear" && bear_moved
      dead("The bear gets pissed off and chews your leg off.")
    elsif choice == "open door" && bear_moved
      gold_room
    else
      puts "I got no idea what that means."
      bear_room 
    end # Fin du bloc boucle
  end
end

def cthulhu_room
  puts "Here you see the great evil Cthulhu."
  puts "He, it, whatever stares at you and you go insane."
  puts "Do you *FLEE* for your life or eat your *HEAD* ?"
  
  print "> "
  choice = $stdin.gets.chomp
  
  if choice.include? "flee"
    start
  elsif choice.include? "head"
    dead("Well that was tasty !")
  else
    cthulhu_room
  end
end


def gold_room
  puts "This room is full of gold. How much do you take?"
  
  print "> "
  choice = $stdin.gets.chomp
  
  if /[0-9]/.match(choice)
    how_much = choice.to_i
  else
    puts "Man, learn to type a number."
    gold_room
  end
  
  if how_much < 50
    puts "Nice, you're not greedy, you win !"
    exit(0)
  else
    dead("You greedy bastard!")
  end
end


def dead(why)
  puts why, "You lost SOB"
  exit(0)
end



start