# s = File.read('data/survey.tsv')
# print s.to_s
require_relative 'tsv_buddy'
class Tester
  include TsvBuddy
end

t = Tester.new
# a = t.take_tsv(File.read('data/survey.tsv'))
# File.write('tsv_filename.tsv', t.to_tsv)
puts t.to_s
# File.write('tsv_filename.tsv', t)