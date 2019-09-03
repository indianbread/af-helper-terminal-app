require 'tty-prompt'
require 'CSV'
require_relative 'chadsvasccalc.rb'
require_relative 'resultviewer.rb'


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
        "Enter the patient's name to view results"
        patientname = gets.strip.downcase
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