module TimeFormatHelper
  def ldate_time(time, hash = {})
    time ? l(time, hash) : nil
  end
end
