require 'tty-prompt'
require 'CSV'
require 'tty-font'
require 'colorize'
require_relative 'chadsvasccalc.rb'
require_relative 'resultviewer.rb'

font = TTY::Font.new(:standard)

puts font.write("AF-Helper")

puts "Hi Doc! I am your cardiovascular companion, the atrial fibrillation helper! Select from the following options below:".colorize(:black ).colorize( :background => :yellow)
puts 
continue = "y"

while continue == "y"
    # begin
        puts "1. CHADS-VASc calculator"
        puts "2. View CHADS-VASc results for a patient"
        puts "3. Select an anticoagulant drug to prescribe"
        puts "4. Exit"
        puts
        print ">" 
        selection = gets.strip.to_i
        system('clear')

        if selection == 1
           chadsvascscore = chadsvasccalc.to_i
           chadsvasceval(chadsvascscore)

        elsif selection == 2
        puts "Enter the patient's name to view results"
            patientname = gets.strip.downcase
            resultviewer(patientname)

        elsif selection == 3
            puts "These are the recommended first line oral agents for anticoagulation. There is no preference as to which one is to be trialed first."

        elsif selection == 4
        exit
        else
            puts 'Invalid selection!'  
        end
        puts "\nPress Y to continue or any other key to exit"
        continue = gets.strip.downcase
        system('clear')
    # rescue => error_object
    #     puts "Something went wrong! Return to menu? Y/N"
    #     continue = gets.strip.downcase
    # end
end

