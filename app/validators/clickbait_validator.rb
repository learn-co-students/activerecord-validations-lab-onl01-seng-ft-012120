class NonClickbait < ActiveModel::Validator 

  def validate(record)
    clickbait = ["Won't Believe", "Secret", "Top [number]","Guess"]
    if !record.title.include(clickbait)
      record.errors[:base] << "Non a Clickbait"
    end
  end
end