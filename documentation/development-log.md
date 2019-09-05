## Tuesday 3rd September, 2019 ##

I have completed the CHADS-VASc and risk evaluation portion of the application as planned.
I had initially wanted to implement a comprehensive drug selector feature where the user will have to answer a further series of questions to narrow down the drug to prescribe, but due to time constraints I have decided against this feature.
My next task is to finalize the result viewer to enable the user to search by patient name. I am not sure how to do this yet but I think I may need to parse the csv into a hash within an array and search by key or index.
So far, I have not had to create classes but this is something that I would like to practice.

I am still undecided on two options:

* To create a class and a method within the class to enable modification of the CHADS-VASc result for a patient
    or
* To create a class and a method within the class to view and modify the medication for a patient. 

At this stage I most likely will implement the latter once I figure out how to parse the drug file CSV (not yet started) into an array.

# Wednesday 4th September, 2019 #
I have succesfully completed the results viewer.
As one of the criteria for the terminal app is to be able to utilize a command line argument, I will most likely implement this feature by allowing the end user to add a medication using this method rather than calling a method within the actual application. 

Update: Unfortunately, I am unable to implement ARGV for adding a medication as it requires calling an instance of the patient class which I am unable to do as I don't know how to and not sure that it is possible. I used ARGV to implement an on-the-fly note feature which displays the note face up when the user logs in to the application.

I also utilised the Patient class by adding an add medication method, but due to time constraints I have not made the updated Patient objects write to a CSV so for now the drug added is not stored in a record.

Some cosmetic changes such as fonts and tables have been implemented to improve the user experience.

# Thursday 5th September, 2019 #
Today I have spent the majority of the time on implementing the error handling and fixing bugs.
Initially I had put a rescue section in each different files, but decided to remove them from the files containing the methods and just include a single rescue in the master af-helper.rb file where all the methods are called from.
I was mindful of including different error messages for the different scenarios, e.g. CSV not available, invalid selection/user input rather than relying on the rescue message to handle all the different types of errors.
Some of the bugs were identified as I was executing the manual testing plan. I picked up another error when briefly testing the add medication method but due to time constraints I will not address this error yet. I may go back to the code and fix this error after I complete the required documentation components.
I have run the rubocop gem to fix the styling of the code.



