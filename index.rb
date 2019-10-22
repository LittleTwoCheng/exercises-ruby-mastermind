class MasterMind
  # color
  # r(red), b(blue), g(green)
  # y(yellow), p(purple), o(orange)

  # Flag
  # w(white): color is correct but position is wrong
  # r(red): color & position are both correct
  # n(empty)

  def initialize()
    # assign 4 secret color for PC
    colors = ['r', 'b', 'g', 'y', 'p', 'o']

    @codes = [
      pick_color(colors),
      pick_color(colors),
      pick_color(colors),
      pick_color(colors),
    ]

    @guess_pool = [
      # [ "r", "b", "g", "y"]
    ]
    @flag_pool = [
      # ["w", "r", "n", "n"]
    ]

    @max_count = 12

    puts @codes
  end

  def pick_color(colors)
    colors.sample
  end

  def get_flags(codes, guess)
    # TODO make it random
    flags = []
    guess.each_with_index do |color, idx|
      if codes[idx] == color
        flags << 'r'
      elsif codes.include?(color)
        flags << 'w'
      else
        flags << 'n'
      end
    end

    flags
    # guess.map.with_index do |color, idx|
    #   # p "with_index"
    #   # p color
    #   if codes[idx] == color
    #     p "match R"
    #     # r(red): color & position are both correct
    #     return 'r'
    #   end

    #   return 'w' if codes.contain(color)

    #   'n'
    # end
  end

  def check_win(flags)
    flags.join == 'rrrr'
  end

  def render(guess_pool, flag_pool)
    puts '==== Your Guess ==='
    p guess_pool
    puts '==== Flags History ==='
    p flag_pool
  end

  def start 
    count = 0
    loop do
      puts 'Enter Color r(red), b(blue), g(green) y(yellow), p(purple), o(orange)'
      guess = gets.chomp.split('')

      @flag_pool << get_flags(@codes, guess)

      if check_win(@flag_pool.last)
        puts 'You win!'
        break
      end

      @guess_pool << guess

      render(@guess_pool, @flag_pool)

      count += 1

      if count >= @max_count
        puts 'You lose'
        break
      end
    end
  end
end

game = MasterMind.new
game.start
