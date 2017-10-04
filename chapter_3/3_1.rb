def check_parens_balance(str)
  stack = []
  bad_index = nil
  last_index = str.length - 1

  str.split("").each.with_index do |char, i|
    if char == ")"
      top = stack.pop
      if top.nil? && i != last_index
        puts "#{i},#{last_index}, #{stack} "
        bad_index = i
      end
    end

    if i == last_index
      if !stack.empty? || char  == "("
        bad_index = i
      end
    end

    break unless bad_index.nil?
    stack << char if char == "("
  end

  if !bad_index.nil?
    return bad_index
  else
    return true
  end
end
