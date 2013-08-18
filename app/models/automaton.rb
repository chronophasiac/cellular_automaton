class Automaton < ActiveRecord::Base
  attr_accessible :rule, :input_state

  def display
    state = init_state 
    max = 64
    str = ''

    max.times do |gen|
      (max - gen).times { str << ' ' }
      state.each { |x| x == 1 ? str << '*' : str << ' ' }
      str << "\n"
      state = evolve(rule, state)
      str
    end

    str
  end

  private

  def init_state
    result = []
    s_arr = input_state.to_s.split('')
    s_arr.each do |s|
      result << s.to_i
    end

    result
  end

  def evolve(rule, state)
    def state.[](x)
      (x < 0 or x >= length) ? 0 : fetch(x)
    end
    next_state = []
    for i in (-1..state.length+1)
      bit = state[i + 1] | (state[i] << 1) | (state[i - 1] << 2)
      mask = 1 << bit
      next_state[i + 1] = ((mask & rule) != 0) ? 1 : 0
    end
    return next_state
  end

end
