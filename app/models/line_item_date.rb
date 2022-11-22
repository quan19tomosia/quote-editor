class LineItemDate < ApplicationRecord
  belongs_to :quote

  has_many :line_items, dependent: :destroy

  validates :date, presence: true, uniqueness: { scopre: :quote_id }

  scope :ordered, -> { order(date: :asc) }

  def previous_date
    quote.line_item_dates.ordered.where("date < ?", date).last
  end
end
