# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    @data_s = tsv.to_s
    # print @data_s
    @data = []
    tsv = tsv.split(/\n/)
    @title = tsv[0].split(/\t/)
    1.upto tsv.length - 1 do |i|
      tsv_line = tsv[i].split(/\t/)
      @data << string_to_hash(tsv_line)
    end
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
    data_s = ''
    data_s += "#{tsv_title(@data)}\n"
    @data.each do |datas|
      tsv_line = ''
      datas.each do |key, value|
        tsv_line += key == 'date' ? value.to_s : "\t#{value}"
      end
      data_s += "#{tsv_line}\n"
    end
    data_s
  end

  def tsv_title(yml_datas)
    title = ''
    yml_datas[0].each do |key|
      title += key[0] == 'date' ? key[0].to_s : "\t#{key[0]}"
    end
    title
  end
end
