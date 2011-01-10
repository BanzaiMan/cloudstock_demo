# set up temp directory for PDFs.
require 'fileutils'

pdfdir = ["tmp", "pdfs"]

ln_sf(File.join(shared_path, pdfdir), File.join(release_path, pdfdir))