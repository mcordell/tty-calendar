# frozen_string_literal: true
RSpec.describe TerminalCalendar::Selection::Grid do
  before { Timecop.freeze(Date.new(2023, 6, 7)) }
  after { Timecop.return }
  let(:width) { 2 }
  let(:height) { 1 }
  let(:pastel) { Pastel.new(enabled: true) }
  subject(:instance) { described_class.new(width, height, pastel: pastel) }

  describe '#render_lines' do
    subject { instance.render_lines }

    let(:cal_day) { TerminalCalendar::Month::CalendarDay.new(Date.today, pastel) }

    let(:current_day) { pastel.red(' 7') }

    before do
      instance.populate_from_objects([[cal_day]])
    end

    it 'equals lines' do
      is_expected.to eq ["\e[31m 7\e[0m   "]
    end
  end
end
