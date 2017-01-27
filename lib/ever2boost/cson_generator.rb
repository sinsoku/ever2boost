require 'ever2boost/util'

module Ever2boost
  class CsonGenerator
    class << self
      def build(folder_hash, note)
        cson = <<-EOS
type: "MARKDOWN_NOTE"
folder: "#{folder_hash}"
title: "#{note.title}"
content: '''
  # #{note.title}
  #{note.md_content}
'''
tags: []
isStarred: false
createdAt: "#{timestamp}"
updatedAt: "#{timestamp}"
        EOS
      end

      def timestamp
        Time.now.strftime('%Y-%m-%dT%H:%M:%S')
      end

      def output(folder_hash, note, output_dir)
        Util.make_output_dir(output_dir)
        File.open("#{output_dir}/notes/#{note.file_name}.cson", 'w') do |f|
          f.write(build(folder_hash, note))
        end
      end
    end
  end
end
