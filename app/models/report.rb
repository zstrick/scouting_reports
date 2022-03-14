class Report < ApplicationRecord
  belongs_to :player
  belongs_to :scout
  delegated_type :reportable, types: %w[ PitcherReport PositionReport ], dependent: :destroy
  accepts_nested_attributes_for :reportable

  validates :player, presence: true
  validates :scout, presence: true
  validates_associated :reportable
end
