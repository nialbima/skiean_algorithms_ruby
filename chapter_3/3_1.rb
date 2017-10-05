# give an algorithm that returns true if a string contains properly nested and
# balanced parentheses, and false otherwise.
# bonus points for the index.

def check_parens_balance(str)
  stack = []
  bad_index = nil
  last_index = str.length - 1

  str.split("").each.with_index do |char, i|
    if char == ")"
      top = stack.pop
      if top.nil? && i != last_index
        bad_index = i
      end
    end

    if i == last_index && !stack.empty?
      bad_index = stack[1]
    end

    break unless bad_index.nil?
    stack << [char, i] if char == "("
  end

  return [bad_index.nil?, bad_index]
end
