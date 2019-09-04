# frozen_string_literal: true

require 'Date'

class Patient
  attr_accessor :medication
  @@instance_count = 0
  def initialize(patientname, agegroup, gender, chf, hypertension, stroke, vascular, diabetes, cvscore)
    @date = DateTime.now.strftime('%Y-%m-%d %H:%M:%S %z')
    @patientname = patientname
    @agegroup = agegroup
    @gender = gender
    @chf = chf
    @hypertension = hypertension
    @stroke = stroke
    @vascular = vascular
    @diabetes = diabetes
    @cvscore = cvscore
    @medication = nil
    @@instance_count += 1
  end

  def viewresult
    puts "Date: #{@date}"
    puts "Patient Name: #{@patientname}"
    puts "Age Group: #{@agegroup}"
    puts "Gender: #{@gender}"
    puts "CHF History: #{@chf}"
    puts "Hypertension History: #{@hypertension}"
    puts "Stroke History: #{@stroke}"
    puts "Vascular Disease History: #{@vascular}"
    puts "Diabetes History: #{@diabetes}"
    puts "CHADS-VASc Score: #{@cvscore}"
    puts "Anticoagulant Medication: #{@medication}"
end
end
