# frozen_string_literal: true

require 'CSV'
require_relative 'patient-class.rb'

def loadpatient(patientname)
  csv_text = File.open('cvresult.csv', 'r')
  csv = CSV.parse(csv_text, headers: true)
  results_arr = []
  patient1 = nil
  csv.each do |row|
    row_data = row.to_hash
    next unless row_data['Name'] == patientname

    # results_arr << row_data
    patientname = row_data['Name'].capitalize
    agegroup = row_data['Age_Range']
    gender = row_data['Gender']
    chf = row_data['CHF']
    hypertension = row_data['Hypertension']
    stroke = row_data['Stroke_History']
    vascular = row_data['Vascular_Disease_History']
    diabetes = row_data['Diabetes_History']
    cvscore = row_data['CV_Score'].to_i

    patient1 = Patient.new(patientname, agegroup, gender, chf, hypertension, stroke, vascular, diabetes, cvscore)
  end
  # if cvscore == 0
  # else
  # medication = ""
  # patient1 = Patientmed.new(patientname,agegroup,gender,chf,hypertension,stroke,vascular,diabetes,cvscore,medication)
  # end

  # puts "Patient Name: #{name}"
  # puts "Age Group: #{agegroup}"
  # puts "Gender: #{gender}"
  # puts "CHF History: #{chf}"
  # puts "Hypertension History: #{hypertension}"
  # puts "Stroke History: #{stroke}"
  # puts "Vascular Disease History: #{vascular}"
  # puts "Diabetes History: #{diabetes}"
  # puts "CHADS-VASc Score: #{cvscore}"

  # patient1 = Patient.new(patientname,agegroup,gender,chf,hypertension,stroke,vascular,diabetes,cvscore)
  # puts patient1.viewresult
  patient1
end

def resultviewer(patientname)
  patientname = patientname
  patient = loadpatient(patientname)
  patient.viewresult
end
