class Listing < ActiveRecord::Base
  enum category: {
    'apartment': 0,
    'terrace': 1,
    'bungalow': 2,
    'villa': 3
  }

  filterrific(
  default_filter_params: { sorted_by: 'title_asc' },
  available_filters: [
    :category,
    :title,
    :location,
    :room_nums,
    :bathroom_nums
    ]
  )

  scope :category, ->(category) { where("category = ?", category) }
  scope :title, ->(title) { where("category = ?", title) }
  scope :location, ->(location) { where("category = ?", location) }
  scope :room_nums, ->(room_nums) { where("category = ?", room_nums) }
  scope :bathroom_nums, ->(bathroom_nums) { where("category = ?", bathroom_nums) }

  # This method provides select options for the `sorted_by` filter select input.
  # It is called in the controller as part of `initialize_filterrific`.
  def self.options_for_category
    ['apartment', 'terrace', 'bungalow', 'villa']
  end
  def self.options_for_room_nums
    [1,2,3]
  end
  def self.options_for_bathroom_nums
    [3,4,5,6]
  end

  def self.options_for_sorted_by
    [
      ['Category', 'category_asc'],
      ['Title', 'title_asc'],
      ['Location', 'location_asc'],
      ['Rooms', 'room_nums_asc'],
      ['Bathrooms', 'bathroom_nums_asc']
    ]
  end
end
