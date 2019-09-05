# frozen_string_literal: true

require 'Date'
require_relative 'resultviewer.rb'

class Patient
  def initialize(date, patientname, agegroup, gender, chf, hypertension, stroke, vascular, diabetes, cvscore)
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
    @medication = []
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
    @medication << medication
    @medication
  end
end
