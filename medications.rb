require 'terminal-table'
require_relative 'patient-class.rb'
require 'CSV'
require 'colorize'

def druglist
headers = []
drug_content = []

File.open("druglist.csv","r").each_with_index do |line,index|
    if line.length > 0 #Ensure that the line is not empty
        if index == 0
            sub_arr = line.split(",")
            sub_arr.each do |field|
                field.delete!("\r\n")
                headers << field
            end

        else
            line.delete!("\r\n")
            drug_content << line.split(",")
        end
    end
end

table = Terminal::Table.new :headings => headers, :rows => drug_content

puts "These are the recommended first line oral agents for anticoagulation. There is no preference as to which one is to be trialed first.".colorize(:blue ).colorize( :background => :white)
puts
puts table

end






