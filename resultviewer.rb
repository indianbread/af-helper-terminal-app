# frozen_string_literal: true

require 'CSV'
require_relative 'patient-class.rb'

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

    patient1 = Patient.new(date, patientname, agegroup, gender, chf, hypertension, stroke, vascular, diabetes, cvscore)
  end
  patient1
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
