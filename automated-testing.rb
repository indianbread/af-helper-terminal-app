# frozen_string_literal: true

# Feature: Storing results of the CHADS-VASc questions
# Testing that results are writing to file
# calling patient created during manual testing
# Validate that data can be parsed from CSV & instantiated as a Patient class object

require_relative 'resultviewer.rb'

patientname = 'santa claus'
if loadpatient(patientname).nil?
  puts 'Data not written to CSV'
else
  puts 'Data successfully written to CSV'
end

# validate instance method
# testing add medication method for patient class

patient = loadpatient(patientname)
medication = 'dabigatran 150 mg'

patient.medication = 'dabigatran 150 mg'
if patient.medication = medication == 'dabigatran 150 mg'
  puts 'Instance method executed sucessfully'
else puts 'Instance method did not execute'
end
