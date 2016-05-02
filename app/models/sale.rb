class Sale < ActiveRecord::Base

  require 'digest/sha1'

  validates_presence_of :password
  attr_accessor :password

  before_save :encrypt_password

  def self.find_with_password(id, password)
    pwd = Digest::SHA1.hexdigest(password.to_s)
    Sale.find_by_id_and_hashed_password(id, pwd)
  end

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

  private

  def encrypt_password
    unless self.password.blank?
      self.hashed_password = Digest::SHA1.hexdigest(self.password.to_s)
      self.password = nil
    end
    return true
  end

end
