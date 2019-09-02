require "tty-prompt"

def chadsvasccalc
cvscore = 0
    prompt = TTY::Prompt.new
    age = prompt.select("What is the patient\'s age?", %w(<65 65-74 >75))
    if age == "<65"
        cvscore += 0
    elsif age == "65-74"
        cvscore += 1
    else
        cvscore += 2 
    end
 return cvscore
end

p cvcscore = chadsvasccalc