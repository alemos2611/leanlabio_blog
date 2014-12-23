if Rails.env.production?
  AnalyticsRuby = Segment::Analytics.new({
      write_key: 'BtSFhKWsrs',
      on_error: Proc.new { |status, msg| print msg }
  })
elsif Rails.env.development?
  AnalyticsRuby = Segment::Analytics.new({
      write_key: 'v1lC6vLpwx',
      on_error: Proc.new { |status, msg| print msg }
  })
end
