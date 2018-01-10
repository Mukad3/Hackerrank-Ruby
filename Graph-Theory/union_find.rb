#!/bin/ruby

require 'set'

class UF
  attr_accessor :nodes, :edges, :adj
  def initialize(n=0, data_set=[[1, 2], [2, 3]])
    @nodes = Array.new((0..n-1).to_a)
    @edges = Array.new(data_set)
    @adj = Array.new(n)
    adj.map!{|x| x = -1}
  end

  def union(node1, node2)
    adj[find(node1)] -= 1
    adj[find(node2)] = node1
  end

  def make_sets
    @edges.each do |x|
      union(x[0], x[1])
    end
  end


  #TODO: Path compression
  # fix up pointers etc....
  #
  def find(node)
    if adj[node] < 0 then
      return node
    else
      return find(adj[node])
    end
  end




end

edges = [[1,3], [2,3]]
quf = UF.new(10, edges)
quf.make_sets








