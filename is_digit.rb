class DigitState
  BEG = 0
  NEGATIVE1 = 1
  DIGIT1 = 2
  DOT = 3
  DIGIT2 = 4
  E = 5
  NEGATIVE2 = 6
  DIGIT3 = 7
end

@state_procs = {
  DigitState::BEG => Proc.new { |x| true },
  DigitState::NEGATIVE1 => Proc.new { |x| x == '-' },
  DigitState::DIGIT1 => Proc.new { |x| !(x =~ /[[:digit:]]/).nil? },
  DigitState::DOT => Proc.new { |x| x == '.' },
  DigitState::DIGIT2 => Proc.new { |x| !(x =~ /[[:digit:]]/).nil? },
  DigitState::E => Proc.new { |x| x == 'e' },
  DigitState::NEGATIVE2 => Proc.new { |x| x == '-' },
  DigitState::DIGIT3 => Proc.new { |x| !(x =~ /[[:digit:]]/).nil? }
}

@fsm = {
  DigitState::BEG => [DigitState::NEGATIVE1, DigitState::DIGIT1],
  DigitState::NEGATIVE1 => [DigitState::DIGIT1, DigitState::DOT],
  DigitState::DIGIT1 => [DigitState::DIGIT1, DigitState::DOT, DigitState::E],
  DigitState::DOT => [DigitState::DIGIT2],
  DigitState::DIGIT2 => [DigitState::DIGIT2, DigitState::E],
  DigitState::E => [DigitState::DIGIT3, DigitState::NEGATIVE2],
  DigitState::NEGATIVE2 => [DigitState::DIGIT3],
  DigitState::DIGIT3 => [DigitState::DIGIT3]
}

# @param {String} s
# @return {Boolean}
def is_number(s)
  s = s.strip.split('')
  state = DigitState::BEG
  s.each do |ch|
    found_next_state = false
    @fsm[state].each do |next_state|
      if @state_procs[next_state].call(ch)
        found_next_state = true
        state = next_state
        break
      end
    end
    return false unless found_next_state
  end

  state == DigitState::DIGIT1 || state == DigitState::DIGIT2 || state == DigitState::DIGIT3
end

p is_number("12.3")
# True

p is_number("12a")
# False