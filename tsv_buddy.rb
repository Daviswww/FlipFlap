# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    @data = []
    tsv = tsv.split(/\n/)
    @title = tsv[0].split(/\t/)
    1.upto tsv.length - 1 do |i|
      tsv_line = tsv[i].split(/\t/)
      @data << string_to_hash(tsv_line)
    end
    @data
  end

  def string_to_hash(tsv_line)
    hash = {}
    0.upto @title.length - 1 do |j|
      hash[@title[j]] = tsv_line[j]
    end
    hash
  end
  # to_tsv: converts @data into tsv string
  # returns: String in TSV format

  def to_tsv
    @data
  end
end

# class Tester
#   include TsvBuddy
# end

# t = Tester.new.take_tsv(File.read('data/survey.tsv'))
# print t