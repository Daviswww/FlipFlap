# Module that can be included (mixin) to take and output Yaml data
require 'yaml'

module YamlBuddy
  def take_yaml(yaml)
    @data = YAML.safe_load(yaml)
  end

  def to_yaml
    tsv_to_yaml = []
    tsv = @data.split(/\n/)
    @title = tsv[0].split(/\t/)
    1.upto tsv.length - 1 do |i|
      tsv_line = tsv[i].split(/\t/)
      tsv_to_yaml << tsv_to_hash(tsv_line)
    end
    tsv_to_yaml.to_yaml
  end

  def tsv_to_hash(tsv_line)
    hash = {}
    0.upto @title.length - 1 do |j|
      hash[@title[j]] = tsv_line[j]
    end
    hash
  end
end
