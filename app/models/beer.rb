# Generates beer objects
class Beer < ActiveRecord::Base
  has_attached_file :beer_xml, bucket: 'brewrecipes'
  validates_attachment_content_type :beer_xml, content_type: 'text/xml'

  before_save :parse_file

  belongs_to :user

  private

  def parse_file
    temp = beer_xml.queued_for_write[:original]
    doc = Nokogiri::XML(temp)
    extract_data(doc)
  end

  def extract_data(doc)
    doc.xpath("//RECIPE").each do |node|
      self.name = node.at_xpath("NAME").value
      self.type = node.at_xpath("TYPE")
      self.est_eff = node.at_xpath("EFFICIENCY")
      self.style = node.at_xpath("STYLE//NAME")
      self.style_category = node.at_xpath("STYLE//CATEGORY")
      self.og = node.at_xpath("EST_OG")
      self.fg = node.at_xpath("EST_FG")
      self.srm = node.at_xpath("EST_COLOR")
      self.ibu = node.at_xpath("IBU")
      self.abv = node.at_xpath("EST_ABV")
    end
  end
end
