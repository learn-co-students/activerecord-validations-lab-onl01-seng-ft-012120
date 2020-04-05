class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250} 
    validates :summary, length: {maximum: 250} 
    validate :clickbait, on: :create
    validates :category, inclusion: { in: %w(Fiction Non-Niction),
        message: "%{value} is not a valid category" }


        def clickbait
            if !title.nil? && (!title.include?("Won't Believe"|| "Secret"|| "Top" ||"Guess"))
            errors.add(:title, "is not clickbait-y")
            end 
        end
end
