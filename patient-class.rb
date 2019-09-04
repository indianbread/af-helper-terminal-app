# frozen_string_literal: true

require 'Date'
require_relative 'resultviewer.rb'

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
    @medication = []
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
    puts "Anticoagulant Medication: #{@medication.to_s}".colorize(:black ).colorize( :background => :yellow)
end

def medication=(medication)
    @medication << medication
    return @medication
end

def medication
    @medication
end

end


