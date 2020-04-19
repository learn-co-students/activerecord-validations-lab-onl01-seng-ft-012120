require 'pry'

class Post < ActiveRecord::Base
    include ActiveModel::Validations
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'], message: "Invalid category" }
    #validate :is_click_bait

    validate do |title|
        must_be_friends
      end
    
      def must_be_friends
        click_bait_titles = ["Won't Believe", "Secret", "Top", "Guess"]
        click_bait = false 
        click_bait_titles.each do |title_each|
            if title != nil
                if title.include? title_each
                    click_bait = true
                end
            end
        end
        errors.add(:title, 'Title must be clickbait') unless click_bait == true
      end

    # def is_click_bait
    #     click_bait_titles = ["True Facts", "Won't Believe", "Secret", "Top", "Guess"]
    #     is_click_bait = false

    #     click_bait_titles.each do |title_each|
    #         if title.include? title_each
    #             is_click_bait = true
    #         end
    #     end

    #     binding.pry
    #     if is_click_bait == false
    #         errors.add(title, "must be clickbait")
    #     else
    #         return true
    #     end
    # end

end
