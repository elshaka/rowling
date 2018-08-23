module Rowling
  class Display
    def self.display(score)
      frame_numbers_row = "Frame\t\t"
      (1..10).each { |frame_number| frame_numbers_row += "#{frame_number}\t" }
      puts frame_numbers_row

      score.each do |player, frames|
        puts player
        pinfalls_row = "Pinfalls\t"
        score_row = "Score\t\t"
        frames.each_with_index do |frame, frame_index|
          pins = frame["pins"]
          unless Rowling::Score.tenth_frame?(frame_index)
            if Rowling::Score.strike?(pins)
              pinfalls_row += "   X\t"
            elsif Rowling::Score.split?(pins)
              pinfalls_row += "#{pins[0]}  /\t"
            else
              pinfalls_row += "#{pins[0]}  #{pins[1]}\t"
            end
          else
            pinfalls_row += display_tenth_frame(pins)
          end

          score_row += "#{frame["score"]}\t"
        end
        puts pinfalls_row
        puts score_row
      end
    end

    def self.display_tenth_frame(pins)
      output = (pins[0] == 10 ? "X" : pins[0].to_s) + "  "
      [[pins[0], pins[1]], [pins[1], pins[2]]].each do |pin_pair|
        if pin_pair[1] == 10
          output += "X  "
        elsif pin_pair[0].to_i + pin_pair[1].to_i == 10
          output += "/  "
        else
          output += pin_pair[1].to_s + "  "
        end
      end

      output
    end
  end
end
