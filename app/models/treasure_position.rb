class TreasurePosition < ActiveRecord::Base

  def self.active
    where(active: true).last.to_a
  end

  def to_a
    Array.new << latitude.to_f << longitude.to_f
  end
end