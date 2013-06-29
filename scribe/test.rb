require 'asciidoctor'

doc = Asciidoctor.load_file('book/book.asc')

puts doc.doctitle
#puts doc.attributes