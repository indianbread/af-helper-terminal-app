# frozen_string_literal: true

require 'tty-prompt'
require 'CSV'
require 'tty-font'
require 'colorize'
require 'terminal-table'
# require 'pry'
require_relative 'chadsvasccalc.rb'
require_relative 'resultviewer.rb'
require_relative 'medications.rb'
require_relative 'patient-class.rb'

font = TTY::Font.new(:standard)

puts font.write('AF-Helper')

puts 'Hi Doc! I am your cardiovascular companion, the atrial fibrillation helper!'.colorize(:black).colorize(background: :yellow)
puts "\r\r"
puts "To add On-The-Fly notes type " + "ruby af-helper.rb \"your note here\" ".colorize(:yellow) + "in the terminal without launching the AF-Helper application."
puts "\r\r"
notes_log = []
def add_notes(notes_log)
  notes_log << ARGV
    end

add_notes(notes_log)

table = Terminal::Table.new title: 'On-The-Fly Notes:', rows: notes_log
puts table
puts "\r\r"
puts 'Select from the following options below:'
begin
loop do
    puts '1. CHADS-VASc calculator'
    puts '2. View CHADS-VASc results for a patient'
    puts '3. View anticoagulant drug list'
    puts '4. Add an anticoagulant medication for patient'
    puts '5. Exit'
    puts
    print '>'
    selection = STDIN.gets.chomp.to_i
    system('clear')

    if selection == 1
      chadsvascscore = chadsvasccalc
      # binding.pry
      if chadsvascscore != nil
      chadsvasceval(chadsvascscore)
      else
      end

    elsif selection == 2
      puts "Enter the patient's name to view results"
      patientname = STDIN.gets.chomp.downcase
      resultviewer(patientname)

    elsif selection == 3
      druglist

    elsif selection == 4
      puts 'Enter patient name'
      patientname = STDIN.gets.chomp.downcase
      patient = loadpatient(patientname)
      puts 'Enter drug and dose'
      medication = STDIN.gets.chomp
      patient.medication = medication
      puts "Medication has been added to patient's record".colorize(:blue).colorize(background: :white)
      puts
      patient.viewresult

    elsif selection == 5
      exit
    else
      puts 'Invalid selection!'
    end
    puts "\nPress Y for main menu or any other key to exit"
    continue = STDIN.gets.chomp.downcase
    if continue == 'y'
      system('clear')
    else
      break
      end
  rescue => error_object
    puts 'Something went wrong! This program will terminate. Please contact helpdesk for advice.'.colorize(:red).colorize(background: :white)
    break
  end
end
