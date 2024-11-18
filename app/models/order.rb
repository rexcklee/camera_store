class Order < ApplicationRecord
  enum :status, [ :pending, :completed ]
  enum :province, [ :AB, :BC, :MB, :NB, :NL, :NT, :NS, :NU, :ON, :PE, :QC, :SK, :YT ]
end
