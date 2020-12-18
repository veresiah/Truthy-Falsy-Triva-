class Question 
    
    @@all = []

    def initialize(question)
        question.each do |k,v|
            self.class.attr_accessor key 
            self.send("#{k}=", v)
        end 
        save 
    end 

    def self.all 
        @@all 
    end 

    def save 
        @@all << self
    end 
end 