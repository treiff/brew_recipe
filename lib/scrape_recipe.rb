# Scrapes recipe data from sites.
module ScrapeRecipe
  def get_page(url)
    Nokogiri::HTML(open(url))
  end
end
