# membuat Log dalam bentuk teks
require "file_utils"

module Flogger
  VERSION = "0.1.0"

  def self.new(level : String, message : String)
    begin
      timestamp = Time.local.to_s("%Y-%m-%d %H:%M:%S")
      log_entry = "#{timestamp} [#{level}] - #{message}"

      fileName = Time.local.to_s("%Y/%m/%Y-%m-%d.log")
      logFilePath = "./logs/#{fileName}"

      # Pastikan direktori logs ada, jika tidak, buat secara rekursif
      FileUtils.mkdir_p(File.dirname(logFilePath))

      # Tulis log ke file logFilePath
      File.open(logFilePath, "a") do |file|
        file.puts(log_entry)
      end

      if level == "ERROR"
        Log.error{ message }
      else
        Log.info{ message }
      end

    rescue
      puts "tidak bisa membuat log"
    end
  end
end
