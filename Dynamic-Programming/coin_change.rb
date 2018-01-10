#!/bin/ruby

def getWays(n, c)
    puts c.to_s
    table = Array.new(0, n+1)
    table[0] = 1
    
    for i in 0..c.length-1
        for j in c[i]..n
            puts table[j].to_s
            table[j] += table[j-c[i]]
        end
    end
 
    return table[n]
end

n, m = gets.strip.split(' ')
n = n.to_i
m = m.to_i
c = gets.strip
c = c.split(' ').map(&:to_i)
# Print the number of ways of making change for 'n' units using coins having the values given by 'c'
ways = getWays(n, c)


