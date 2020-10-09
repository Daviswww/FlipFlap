# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    @data = tsv
  end

  def to_tsv
    yaml_to_tsv = ''
    yaml_to_tsv += "#{tsv_title(@data)}\n"
    @data.each do |datas|
      yaml_to_tsv += "#{hash_to_tsv(datas)}\n"
    end
    yaml_to_tsv
  end

  def tsv_title(yml_datas)
    title = ''
    yml_datas[0].each do |key|
      title += key[0] == 'date' ? key[0].to_s : "\t#{key[0]}"
    end
    title
  end

  def hash_to_tsv(datas)
    tsv_line = ''
    datas.each do |key, value|
      tsv_line += key == 'date' ? value.to_s : "\t#{value}"
    end
    tsv_line
  end
end
