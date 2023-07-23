# frozen_string_literal: true

require 'forwardable'
require_relative '../tty/prompt/carousel'
require_relative 'calendar/version'
require_relative 'calendar/month'
require_relative 'calendar/selection/cell'
require_relative 'calendar/selection/selector'
require_relative 'calendar/selection/grid'
require_relative 'calendar/selection/month_page'
require_relative 'calendar/date_picker'
require_relative '../date_extensions'
require 'pastel'
require 'tty-cursor'
require 'tty-reader'

module TTY
  class Calendar
    class Error < StandardError; end

    # This method allows the user to select one or more days starting from the current month calendar.
    #
    # @return [Array<Date>] The selected days.
    def self.date_picker
      TTY::Calendar::DatePicker.pick
    end

    def self.all_months
      @all_months ||= {}
    end
  end
end
