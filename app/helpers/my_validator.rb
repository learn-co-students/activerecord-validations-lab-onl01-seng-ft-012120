class MyValidator < ActiveModel::Validator
  
 def validate(record)
   if record.title
  reqs = ["Won't Believe", "Secret", "Top[number]", "Guess"]
   if reqs.detect {|phrase| record.title.include?(phrase)}.nil?
     record.errors[:title] << "Need a beter title"
      
   end 
 end 
 end 
 
  
  
  
end