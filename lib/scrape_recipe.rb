module ScrapeRecipe

  def get_page(url)
    Nokogiri::HTML(open(url))
  end

end
