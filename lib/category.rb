class Category
    attr_accessor :id, :name
    
    @@all = []
    
    def initialize(id, name)
        @id = id 
        @name = name 
        save
    end 

    def self.all
        @@all
    end 

    def save
        @@all << self 
    end 
end
