class TitleValidator < ActiveModel::Validator
    TITLES = ["Won't Believe", "Secret", "Top", "Guess"]
    def validate(record)
        if record.title
            click_title = nil
            TITLES.each{|name| click_title = record.title if record.title.include?(name)}
            unless !click_title.nil?
                record.errors[:title] << "Title not sufficiently clickbait-y."
            end
        else
            false
        end
    end
end