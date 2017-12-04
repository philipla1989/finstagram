
(1..100).each do | i |
    if (i.to_f / 3).to_int == (i.to_f / 3) and (i.to_f / 5).to_int == (i.to_f / 5)
        puts "FizzBuzz"
    elsif (i.to_f / 5).to_int == (i.to_f / 5)
        puts "Buzz"
    elsif (i.to_f / 3).to_int == (i.to_f / 3)
        puts "Fizz"
    else 
        puts "Nothing!"
    end 
end

# could try using "modulo" method too 