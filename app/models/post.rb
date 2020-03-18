class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum:250}
  validates :summary, length: {maximum:250}
  validates_inclusion_of :category, in: %w( Fiction Non-Fiction )
  validate :non_clickbait


  def non_clickbait
    if self.title.present?
      clickbait = ["Won't Believe", "Secret", "Top [number]","Guess"]
      unless clickbait.any?{|w| self.title.include?(w)}
        errors.add(:title, "Non a clickbait")
      end
    end
  end
end
