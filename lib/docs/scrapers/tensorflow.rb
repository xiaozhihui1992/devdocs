module Docs
  class Tensorflow < UrlScraper
    self.name = 'TensorFlow'
    self.type = 'tensorflow'

    html_filters.push 'tensorflow/entries', 'tensorflow/clean_html'

    options[:container] = '#content'

    options[:attribution] = <<-HTML
      &copy; 2015 The TensorFlow Authors. All rights reserved.<br>
      Licensed under the Apache 2.0 License.
    HTML

    version 'Python' do
      self.base_url = 'https://www.tensorflow.org/versions/r0.7/api_docs/python/'
      self.release = '0.7'
    end

    version 'C++' do
      self.base_url = 'https://www.tensorflow.org/versions/r0.7/api_docs/cc/'
      self.release = '0.7'

      options[:fix_urls] = ->(url) {
        url.sub! '/api_docs/cc/class', '/api_docs/cc/Class'
        url.sub! '/api_docs/cc/struct', '/api_docs/cc/Struct'
        url
      }
    end
  end
end