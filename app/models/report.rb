class Report < ApplicationRecord
  belongs_to :player
  belongs_to :scout
  delegated_type :reportable, types: %w[ PitcherReport PositionReport ], dependent: :destroy

  validates :player, presence: true
  validates :scout, presence: true
end
