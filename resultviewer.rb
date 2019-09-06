# frozen_string_literal: true

require 'CSV'
require_relative 'patient-class.rb'
# require 'pry'

def loadpatient(patientname)
  csv_text = File.open('cvresult.csv', 'r')
  csv = CSV.parse(csv_text, headers: true)
  patient1 = nil
  csv.each do |row|
    row_data = row.to_hash
    next unless row_data['Name'] == patientname

    date = row_data['Date']
    patientname = row_data['Name'].capitalize
    agegroup = row_data['Age_Range']
    gender = row_data['Gender']
    chf = row_data['CHF']
    hypertension = row_data['Hypertension']
    stroke = row_data['Stroke_History']
    vascular = row_data['Vascular_Disease_History']
    diabetes = row_data['Diabetes_History']
    cvscore = row_data['CV_Score'].to_i
    medication = ''
    patient1 = Patient.new(date, patientname, agegroup, gender, chf, hypertension, stroke, vascular, diabetes, cvscore, medication)
    # binding.pry
  end
  csv_text2 = File.open('patientmed.csv', 'r')
  csv2 = CSV.parse(csv_text2, headers: true)
  csv2.each do |row|
    row_data2 = row.to_hash
    next unless row_data2['Name'] == patientname

    medication = row_data2['Medication']
    patient1.medication=(medication)
    # binding.pry
  end
  patient1
  # binding.pry
end

def resultviewer(patientname)
  patient = loadpatient(patientname)
  if patient.nil?
    puts 'Patient not found.'
  else
    patient.viewresult
    puts '---------------------End of result----------------'
end
end
