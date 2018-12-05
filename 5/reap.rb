
def is_upper(c)
  c === c.capitalize
end

# Joins left and right, and does removal of mathicng polymers on the
# boundary.
# Algorithm ensures, that left and right themselves are already reaped.
def join_and_reap(left, right)
  while left.length > 0 && 
        right.length > 0 &&
        (reap?(left[-1], right[0]))
    left.chop!
    right = right[1..-1]
  end

  left + right
end

# true, if a and b should be removed.
def reap?(a, b)
  return false unless a.capitalize === b.capitalize
  
  if (is_upper(a) && !is_upper(b)) ||
    (is_upper(b) && !is_upper(a))
    return true
  end

  false
end

# Reaps the polymers from str.
# Disregards 'remove' polymers.
def reap(str, remove = nil)
  if str.length == 1
    if remove
      if str[0].capitalize === remove.capitalize
        return ''
      end
    end
    return str 
  end

  div = str.length / 2
  
  left = reap(str[0..(div - 1)], remove)
  right = reap(str[div..-1], remove)
  
  join_and_reap(left, right)
end
