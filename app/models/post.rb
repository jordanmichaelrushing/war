class Post < ActiveRecord::Base
  attr_accessible :id, :mail, :strike, :ip_address

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :mail, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  def self.chart_data(start = 3.weeks.ago)
    total_votes = votes_by_day(start)
    yes = where(strike: "yes").votes_by_day(start)
    no = where(strike: "no").votes_by_day(start)
    (start.to_date..Date.today).map do |date|
      {
        created_at: date,
        yes: total_yeses[date] || 0,
        no: total_noes[date] || 0
      }
    end
  end

  def self.votes_by_day(start)
    orders = where(created_at: start.beginning_of_day..Time.zone.now)
    orders = orders.group("date(created_at)")
    orders.each_with_object({}) do |vote, prices|
      prices[order.created_at.to_date] = order.total_votes
    end
  end
end
