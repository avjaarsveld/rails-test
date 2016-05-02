class Sale < ActiveRecord::Base

  # attr_accessor :date, :time
  # attr_accessor :time
  # attr_writer :date, :time

  # before_validation(:on => :create) do
  #   self.datetime = "#{date} #{time}".to_datetime
  # end

  def date
    datetime.strftime('%Y%m%d')
  end

  def date=(d)
    d = d.to_date
    original = datetime || d.to_datetime
    self.datetime = DateTime.new(d.year, d.month, d.day,
      original.hour, original.min, original.sec)
  end

  def time
    datetime.strftime('%H%M')
  end

  def time=(t)
    t = DateTime.strptime(t, '%H%M')
    original = datetime || t.to_datetime
    self.datetime = DateTime.new(original.year, original.month, original.day,
      t.hour, t.min, t.sec)
  end

end
