# set up temp directory for PDFs.
require 'fileutils'

pdfdir = ["tmp", "pdfs"]
FileUtils::mkdir "pdfs"
FileUtils::ln_sf File.join(shared_path, "pdfs"), File.join(release_path, pdfdir)