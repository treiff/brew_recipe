# Generates beer objects
class Beer < ActiveRecord::Base
  update_index('beers#beer') { self }

  self.inheritance_column = :_type_disabled
  has_attached_file :beer_xml, bucket: 'brewrecipes'
  validates_attachment_content_type :beer_xml, content_type: 'text/xml'

  default_scope { order('vote_count DESC') }

  before_save :parse_file
  belongs_to :user


  def self.search(keyword)
    keyword.downcase!
    beer_ids = BeersIndex::Beer.query(
      multi_match: {
        query: keyword,
        type: "phrase_prefix",
        fields: [:name, :style, :type, :ibu]
      }
    ).map { |result| result.attributes["id"] }
    Beer.find(beer_ids)
  end

  def upvote
    increment!(:vote_count, by = 1)
  end

  def downvote
    decrement!(:vote_count, by = 1)
  end

  private

  def parse_file
    temp = beer_xml.queued_for_write[:original]
    doc = Nokogiri::XML(temp)
    extract_data(doc)
  end

  def extract_data(doc)
    doc.xpath("//RECIPE").each do |node|
      self.name = node.at_xpath("NAME").content
      self.type = node.at_xpath("TYPE").content
      self.est_eff = node.at_xpath("EFFICIENCY").content
      self.style = node.at_xpath("STYLE//NAME").content
      self.style_category = node.at_xpath("STYLE//CATEGORY").content
      self.og = node.at_xpath("EST_OG").content
      self.fg = node.at_xpath("EST_FG").content
      self.srm = node.at_xpath("EST_COLOR").content
      self.ibu = node.at_xpath("IBU").content
      self.abv = node.at_xpath("EST_ABV").content
    end
  end
end
