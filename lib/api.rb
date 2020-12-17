class API 
    def self.categories 
        uri = URI.parse("https://opentdb.com/api_category.php") 
        resp = Net::HTTP.get(uri)
        data = JSON.parse(resp) 
        categories = data[:trivia_categories]
        categories.each do |category|
            id = category[:id]
            name = category[:name]
            Category.new(id, name)
        end 
    end  

    def self.question
        uri = URI.parse("https://opentdb.com/api.php?amount=1&category=#{category.id}&type=boolean") 
        resp = Net::HTTP.get(uri)
        data = JSON.parse(resp) 
        question = data[:results]
        category = data[:results][0][:category]
        type = data[:results][0][:type]
        difficulty = data[:results][0][:difficulty]
        question = data[:results][0][:question]
        correct_answer = data[:results][0][:correct_answer]
        incorrect_answer = data[:results][0][:incorrect_answers]
        Question.new(category, type, difficulty, question, correct_answer, incorrect_answer)
    end 
end 