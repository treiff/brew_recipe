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
      doc.root.elements.each do |element|
        p "element is: " + element
      end
    end
end
