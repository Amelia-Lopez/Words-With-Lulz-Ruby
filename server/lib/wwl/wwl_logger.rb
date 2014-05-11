class WwlLogger

  def self.logger
    unless defined? @@log
      $stdout.sync = true
      @@log = Logger.new($stdout)
      @@log.formatter = proc { |severity, datetime, progname, msg|
        "[#{datetime.strftime(@@log.datetime_format)}] #{'%-5s' % severity} #{msg}\n"
      }
      @@log.datetime_format = '%Y-%m-%d %H:%M:%S'
    end

    @@log
  end
end