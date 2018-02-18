module Molt
  class Template
    def self.liquify(template: String, output_file: String, config: {})
      unparsed_template = IO.read(template)
      liquified = Liquid::Template.parse(unparsed_template).render(config)
      File.write(output_file, liquified)
    end
  end
end
