
def words_to_number(string = '')
    if string.length == 10
        x = string.split('')
        
        y = 0
        z = []
        x.each do |letter|
        
            if ["a","b","c"].include?(letter)
                z.push(2)
            elsif ["d","e","f"].include?(letter)
                z.push(3)
            elsif ["g","h","i"].include?(letter)
                z.push(4)
            elsif ["j","k","l"].include?(letter)
                z.push(5)
            elsif ["m","n","o"].include?(letter)
                z.push(6)
            elsif ["p","q","r","s"].include?(letter)
                z.push(7)
            elsif ["t","u","v"].include?(letter)
                z.push(8)
            elsif ["w","x","y","z"].include?(letter)
                z.push(9)
            end
        
        y = y + 1
        end
        
        z = z.join
        puts z
    else
        puts "False"
    end
    
end
        
        
string = gets.chomp
words_to_number(string)
