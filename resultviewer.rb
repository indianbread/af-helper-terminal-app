require 'CSV'


def resultviewer(patientname)
headers =[]
results = []

begin
csv_text = File.read('cvresult.csv') #read return a string including the non-printing characters like carriage return
csv = CSV.parse(csv_text, :headers => true) 
results_arr = []
    csv.each do |row|
    row_data = row.to_hash
        if (row_data['name'] == patientname)
            puts row_data
            results_arr << row_data
        end 
    end
end
rescue => error_object
    puts "Something went wrong! Application will terminate."

end

p results_arr = resultviewer("dfds")

