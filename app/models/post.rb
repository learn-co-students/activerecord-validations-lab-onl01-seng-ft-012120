class Post < ActiveRecord::Base
    validates :title, presence: true 
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :title_is_click_baity

    def title_is_click_baity
        bait = ["Won't Believe", "Secret", "Top [number]", "Guess"]
        if title 
            unless bait.any? { |b| title.match?(b) }
                errors[:title] << "Title is not click-baity"
            end 
        end 
    end
end
