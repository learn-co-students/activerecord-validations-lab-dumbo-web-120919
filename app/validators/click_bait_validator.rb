class ClickBaitValidator < ActiveModel::Validator
    def validate(record)
      title = record[:title]
      unless title && title[/Won't Believe|Guess|Top \d/]
        record.errors[:title] << "Needs more clickbait"
      end
    end

end
  