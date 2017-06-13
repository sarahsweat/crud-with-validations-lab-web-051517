class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :release_year, presence: true, numericality: { less_than: Time.now.year }, if: :released?
  validates :title, uniqueness: { scope: [:release_year, :artist_name] }

  def released?
    released == true
  end

end
