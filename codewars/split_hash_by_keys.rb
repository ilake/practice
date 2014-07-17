require 'ruby-debug'

# [1,2,3,4,5].slice_before{|e| e%2 == 0 }.map{|a| a}
# [[1], [2, 3], [4, 5]]
#
def split_hash_by_key(hash, *args)
  raise Error unless (args - hash.keys).empty?
  hash.slice_before { |k,v| args.include? k }.map { |a| a.to_h }
end

p split_hash_by_key({ :a=>1, :b=>2, :c=>3, :d=>4, :e=>5, :f=>6 }, :c, :e ) == [ {:a=>1, :b=>2}, {:c=>3, :d=>4}, {:e=>5, :f=>6} ]
