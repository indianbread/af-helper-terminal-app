require 'tty-prompt'
require_relative 'chadsvasccalc.rb'
require 'CSV'

puts "Hi Doc! I am your cardiovascular companion, the atrial fibrillation helper!\nSelect from the following options below:"
continue = "y"
while continue == "y"

        puts "\n1. CHADS-VASc calculator\n2. View CHADS-VASc results for a patient\n3. Exit"
        puts
        print ">" 
        selection = gets.strip.to_i
        if selection == 1
           chadsvascscore = chadsvasccalc.to_i
           chadsvasceval(chadsvascscore)
        elsif selection == 2
        elsif selection == 3
        exit
        else
            puts 'Invalid selection! Press Y to return to menu.' 
            
        end
        puts "Press Y to continue or any other key to exit"
        continue = gets.strip.downcase
        system('clear')
end

begin
rescue => error_object
    puts "Something went wrong! Return to menu? Y/N"
    continue = gets.strip.downcase
end