class BusinessHour < ActiveRecord::Base

  WEEK_DAYS = { mon: "Poniedziałek", tue: "Wtorek", wed: "Środa", thu: "Czwartek", fri: "Piątek", sat: "Sobota", sun: "Niedziela" }

  def self.business_hours_keys
    BusinessHour::WEEK_DAYS.map { |k,v| k.to_sym }
  end

end
