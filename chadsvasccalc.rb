# frozen_string_literal: true

require 'tty-prompt'
require 'CSV'
require 'Date'
require 'colorize'
require_relative 'cvresult.csv'

def chadsvasccalc
  prompt = TTY::Prompt.new
  result_id = 0
  date = DateTime.now.strftime('%Y-%m-%d %H:%M:%S %z')
  result_array = []
  # name prompt
  name = prompt.ask('What is the patient\'s name?')
  result_id += 1
  # age prompt
  age = prompt.select("What is the patient\'s age?", %w[<65 65-74 >75])
  cvscore = if age == '<65'
              0
            elsif age == '65-74'
              1
            else
              2
            end

  # sex prompt
  gender = prompt.select("What is the patient\'s gender?", %w[Female Male])

  cvscore += 1 if gender == 'Female'

  # CHF history
  chf = prompt.yes?('History of CHF?')
  cvscore += 1 if chf == true

  # Hypertension history
  hypertension = prompt.yes?('History of hypertension?')
  cvscore += 1 if hypertension == true

  # Stroke/TIA/TE history
  stroke = prompt.yes?('History of stoke/TIA/thromboembolism?')
  cvscore += 2 if stroke == true

  # vascular disease history
  vascular = prompt.yes?('History of vascular disease?')
  cvscore += 1 if vascular == true

  # diabetes history
  diabetes = prompt.yes?('History of diabetes?')
  cvscore += 1 if diabetes == true

  result = {  result_id: result_id,
              date: date,
              name: name,
              age: age,
              gender: gender,
              CHF: chf,
              hypertension: hypertension,
              stroke: stroke,
              vascular: vascular,
              diabetes: diabetes }
  result_array << result

  CSV.open('cvresult.csv', 'a') do |csv|
    result_array.each do |hash|
      csv << hash.values
    end
  end

  puts "The CHADS-VASc score is #{cvscore}."
  cvscore
end

def chadsvasceval(chadsvascscore)
  if chadsvascscore == 0
    puts 'This patient is at' + ' ' + 'low'.colorize(:blue) + ' risk of thromboembolism. Oral anticoagulation is not required.'
  elsif chadsvascscore == 1
    puts 'This patient is at' + ' ' + 'moderate'.colorize(:orange) + ' risk of thromboembolism. Oral anticoagulation may be required.'
  else
    puts 'This patient is at' + ' ' + 'high'.colorize(:red) + ' risk of thromboembolism. Oral anticoagulation is strongly recommended.'
  end
end
