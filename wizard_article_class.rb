class WizardArticle
  attr_reader :title, :url, :description
  def initialize(title, url, description)
    @title=title
    @url=url
    @description=description
  end

  
  def to_csv_array
  	[@title, @url, @description]
  end
  

  def write_to_csv(file)
    CSV.open(file, 'a+') do |file|
       file << (self.to_csv_array)
     end
   end

   def select_article(file, link)
    CSV.foreach(file, headers: false) do |wizard|
      if wizard[1] == link
        return wizard
      end
    end
  end

end
