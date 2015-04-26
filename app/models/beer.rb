# Generates beer objects
class Beer < ActiveRecord::Base
  has_attached_file :beer_xml, bucket: 'brewrecipes'
  validates_attachment_content_type :beer_xml, content_type: 'text/xml'

  belongs_to :user

  private

end
