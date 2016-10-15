module Disposable
  extend ActiveSupport::Concern

  included do
    scope :old, -> { where('created_at < ?', 1.day.ago.in_time_zone) }
  end
end
