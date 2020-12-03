class Baby < ApplicationRecord
  has_many :breastfeedings, dependent: :destroy

  enum gener: [:hombre, :mujer]

  def to_s
    name
  end

  def total_taked
    breastfeedings.pluck(:volume).reduce(&:+)
  end

  def total_q
    breastfeedings.count
  end

  def daily_quantity
    breastfeedings.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).count#[Date.today.beginning_of_day,Date.today.end_of_day]).count
  end

  def last_breast
    breastfeedings.last&.created_at&.to_date
  end

  def daily_volumne
    breastfeedings.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).pluck(:volume).reduce(&:+)
  end

  def daily_minutes
    breastfeedings.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).pluck(:minutes).reduce(&:+)
  end
end
