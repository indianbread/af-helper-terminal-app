require 'terminal-table'
require_relative 'patient-class.rb'
require 'CSV'

headers = []
drug_content = []
# arr_1 = []
File.open("druglist.csv","r").each_with_index do |line,index|
    if line.length > 0 #Ensure that the line is not empty
        if index == 0
            sub_arr = line.split(",")
            sub_arr.each do |field|
                headers << field
            end

        else
        drug_content << line
        end
    end
end
# csv_text = File.open('druglist.csv', 'r')
# csv = CSV.parse(csv_text, :headers => true)
# csv.each do |row|
#     row_data = row.to_a
#     arr_1 << row_data
# end

# p arr_1
p headers
p drug_content

# table = Terminal::Table.new :headings => ['Word', 'Number'], :rows => rows

