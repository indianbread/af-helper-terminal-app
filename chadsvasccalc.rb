require "tty-prompt"
require 'CSV'
require 'Date'
require 'colorize'


# class Array
#     def to_csv(csv_filename="hash.csv")
#       require 'csv'
#       CSV.open(csv_filename, "wb") do |csv|
#         csv << first.keys # adds the attributes name on the first line
#         self.each do |hash|
#           csv << hash.values
#         end
#       end
#     end
#   end


def chadsvasccalc
prompt = TTY::Prompt.new
result_id = 0
date = DateTime.now.strftime("%Y-%m-%d %H:%M:%S %z")
result_array = []
#name prompt
name = prompt.ask('What is the patient\'s name?')
result_id += 1
#age prompt
    age = prompt.select("What is the patient\'s age?", %w(<65 65-74 >75))
    if age == "<65"
        cvscore = 0
    elsif age == "65-74"
        cvscore = 1
    else
        cvscore = 2 
    end

    #sex prompt
    gender = prompt.select("What is the patient\'s gender?", %w(Female Male))

    if gender == "Female"
        cvscore += 1
    else
    end

    #CHF history
    chf = prompt.yes?('History of CHF?')
    if chf == true
        cvscore += 1
    else
    end

    #Hypertension history
    hypertension = prompt.yes?('History of hypertension?')
    if hypertension == true
        cvscore += 1
    else
    end

    #Stroke/TIA/TE history
    stroke = prompt.yes?('History of stoke/TIA/thromboembolism?')
    if stroke == true
        cvscore += 2
    else
    end

    #vascular disease history
    vascular = prompt.yes?('History of vascular disease?')
    if vascular == true
        cvscore += 1
    else
    end

    #diabetes history
    diabetes = prompt.yes?('History of diabetes?')
    if diabetes == true
        cvscore += 1
    else
    end

    result = {  result_id: result_id,
                date: date,
                name: name,
                age: age,
                gender: gender,
                CHF: chf,
                hypertension: hypertension,
                stroke: stroke,
                vascular: vascular,
                diabetes: diabetes
            }
result_array << result
    CSV.open('cvresult.csv','a') do |csv|
            result_array.each do |hash|
              csv << hash.values
            end
        end

 puts "The CHADS-VASc score is #{cvscore}."
 return cvscore
end

def chadsvasceval(chadsvascscore)
    if chadsvascscore == 0
        puts "This patient is at" + " " + "low".colorize(:blue) + " risk of thromboembolism. Oral anticoagulation is not required."
    elsif chadsvascscore == 1
        puts "This patient is at" + " " + "moderate".colorize(:orange) + " risk of thromboembolism. Oral anticoagulation may be required."
    else
        puts "This patient is at" + " " + "high".colorize(:red) + " risk of thromboembolism. Oral anticoagulation is strongly recommended."
    end
end
