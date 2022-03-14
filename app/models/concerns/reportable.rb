module Reportable
  extend ActiveSupport::Concern

  included do
    has_one :report, as: :reportable, touch: true
  end
end
