# frozen_string_literal: true

require 'Date'
require_relative 'resultviewer.rb'

class Patient
  def initialize(date, patientname, agegroup, gender, chf, hypertension, stroke, vascular, diabetes, cvscore, medication)
    @date = date
    @patientname = patientname
    @agegroup = agegroup
    @gender = gender
    @chf = chf
    @hypertension = hypertension
    @stroke = stroke
    @vascular = vascular
    @diabetes = diabetes
    @cvscore = cvscore
    @medication = medication
  end

  def viewresult
    puts "Date completed: #{@date}"
    puts "Patient Name: #{@patientname}"
    puts "Age Group: #{@agegroup}"
    puts "Gender: #{@gender}"
    puts "CHF History: #{@chf}"
    puts "Hypertension History: #{@hypertension}"
    puts "Stroke History: #{@stroke}"
    puts "Vascular Disease History: #{@vascular}"
    puts "Diabetes History: #{@diabetes}"
    puts "CHADS-VASc Score: #{@cvscore}"
    puts "Anticoagulant Medication: #{@medication}".colorize(:black).colorize(background: :yellow)
end

  def medication=(medication)
    med_arr = []
    @medication = medication
    result_med = { name: @patientname,
                   medication: @medication }
    med_arr << result_med
    CSV.open('patientmed.csv', 'a') do |csv|
      med_arr.each do |hash|
        csv << hash.values
      end
    end
    @medication
  end
end
