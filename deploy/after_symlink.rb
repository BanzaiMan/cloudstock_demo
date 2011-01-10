# set up temp directory for PDFs.
require 'fileutils'

pdfdir = ["tmp", "pdfs"]
FileUtils::mkdir File.join(shared_path, pdfdir)
FileUtils::ln_sf File.join(shared_path, pdfdir), File.join(release_path, pdfdir)