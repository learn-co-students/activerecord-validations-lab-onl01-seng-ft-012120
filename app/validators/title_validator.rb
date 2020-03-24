class TitleValidator < ActiveModel::Validator
  def validate(record)
    clickbait = ["Won't Believe", "Secret", "Top", "Guess"]
    if record.title
      unless clickbait.any?{ |w| record.title.include?(w)}
        record.errors[:title] << "Nobody wants to click that!"
      end
    end
  end
end
