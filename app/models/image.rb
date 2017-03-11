class Image < ActiveRecord::Base
  belongs_to :user

  def to_s
  	"#{source}"
  end
end
