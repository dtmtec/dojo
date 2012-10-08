class Scarecrow
  def place(field)
    result = 0
    jump = 0
    field.each_char.each_with_index do |char, index|
      jump -= 1
      next if jump > 0

      if char == '.'
        jump = 3
        result += 1
      end
    end

    return result
  end
end