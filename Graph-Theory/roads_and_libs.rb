#!/bin/ruby

require 'set'

def roadsAndLibraries(n, c_lib, c_road, cities)
    vertices = make_set((1..n).to_a)
    
    cities.each do |a, b|
        first_set = find_set(vertices, a)
        second_set = find_set(vertices, b)
        if first_set != second_set
            vertices.add(first_set | second_set)
            vertices.delete(first_set)
            vertices.delete(second_set)
        end      
    end
    
    #puts vertices.to_a.map{|x| x.to_a.to_s}
    roads_cost = c_road * vertices.to_a.map{|x| x.size - 1}.inject(:+)
    
    if c_road > c_lib
        return n * c_lib
    else
        return vertices.size * c_lib + roads_cost
    end
    
end


def make_set(arr_n)
    vertices = Set.new
        for i in 1..arr_n.size
            vertices.add([i])
        end
    vertices.map!{|x| x.to_set}    
end

def find_set(set, node)
    set.find{|x| x.include?(node)}
end


q = gets.strip.to_i
for a0 in (0..q-1)
  n, m, c_lib, c_road = gets.strip.split(' ')
  n = n.to_i
  m = m.to_i
  c_lib = c_lib.to_i
  c_road = c_road.to_i
  cities = Array.new(m)
  for cities_i in (0..m-1)
    cities_t = gets.strip
    cities[cities_i] = cities_t.split(' ').map(&:to_i)
  end
  result = roadsAndLibraries(n, c_lib, c_road, cities)
  puts result
end

  


