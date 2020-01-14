class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}

    validate :clickbaity_title
    
    # If the title does not contain "Won't Believe", "Secret", "Top [number]", or "Guess", the validator should add a validation.
    def clickbaity_title
        unless self.title == nil || self.title.include?("Won't Believe") || self.title.include?("Secret") || self.title.include?("Top" || self.title.include?("Guess"))
            self.errors.add(:title, "must be catchy!")
        end

    end

    ## SOLUTION CODE

    # validate :is_clickbait?

    # CLICKBAIT_PATTERNS = [
    #   /Won't Believe/i,
    #   /Secret/i,
    #   /Top [0-9]*/i,
    #   /Guess/i
    # ]
  
    # def is_clickbait?
    #   if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
    #     errors.add(:title, "must be clickbait")
    #   end
    # end
end
