require 'tty-prompt'
require 'CSV'
require 'tty-font'
require 'colorize'
require_relative 'chadsvasccalc.rb'
require_relative 'resultviewer.rb'
require_relative 'medications.rb'
require_relative 'patient-class.rb'

font = TTY::Font.new(:standard)

puts font.write("AF-Helper")

puts "Hi Doc! I am your cardiovascular companion, the atrial fibrillation helper! Select from the following options below:".colorize(:black ).colorize( :background => :yellow)
puts 
continue = "y"

while continue == "y"
    # begin
        puts "1. CHADS-VASc calculator"
        puts "2. View CHADS-VASc results for a patient"
        puts "3. View anticoagulant drug list"
        puts "4. Add an anticoagulant medication for patient"
        puts "5. View on-the-fly notes"
        puts "6. Exit"
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
            druglist

        elsif selection == 4
            puts "Enter patient name"
            patientname = gets.strip.downcase
            patient = loadpatient(patientname)
            puts "Enter drug and dose"
            medication = gets.strip
            patient.medication=(medication)
            puts "Medication has been added to patient's record".colorize(:blue).colorize( :background => :white)
            puts
            patient.viewresult
            

        elsif selection == 5
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

