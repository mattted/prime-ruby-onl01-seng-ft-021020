require 'benchmark'

# Trial Division
def prime?(n)
  return false if n < 2
  return true if n < 4

  !(2..Integer.sqrt(n)).to_a.any? { |num| n % num == 0}

end


# Basic
def prime_basic?(n)
  return false if n < 2
  !(2...n).to_a.any? { |num| n % num == 0 }
end

# sieve
def prime_sieve?(n)
  return false if n < 2
  prime = Array.new(n+1, true)
  p = 2
  while (p ** 2 <= n)
    if (prime[p] == true)
      i = p ** 2
      while i < n + 1
        prime[i] = false
        i += p
      end
    end
    p += 1
  end
  prime_numbers = []
  prime.each_with_index do |is_prime, i|
    prime_numbers << i if is_prime
  end
  
  if prime_numbers.last == n
    true
  else
    false
  end

end

puts "Trial Division"
puts Benchmark.measure{ prime?(10000) }

puts "Basic"
puts Benchmark.measure{ prime_basic?(10000) }

puts "Sieve"
puts Benchmark.measure{ prime_sieve?(10000) }
