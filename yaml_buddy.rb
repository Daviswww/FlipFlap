# Module that can be included (mixin) to take and output Yaml data
require 'yaml'

module YamlBuddy
  def take_yaml(yaml)
    yml_datas = YAML.safe_load(yaml)
    @data = ''
    @data += "#{tsv_title(yml_datas)}\n"
    yml_datas.each do |datas|
      tsv_line = ''
      datas.each do |key, value|
        tsv_line += key == 'date' ? value.to_s : "\t#{value}"
      end
      @data += "#{tsv_line}\n"
    end
    @data
  end
  
  def tsv_title(yml_datas)
    title = ''
    yml_datas[0].each do |key|
      title += key[0] == 'date' ? key[0].to_s : "\t#{key[0]}"
    end
    title
  end

  def to_yaml
    @data
  end
end

# class Tester
#   include YamlBuddy
# end

# t = Tester.new.take_yaml(File.read('data/survey.yml'))