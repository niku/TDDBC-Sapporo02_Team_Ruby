require_relative './spec_helper'
require 'TDDBC-Sap02-Legacy'

describe Database  do
  context "when initialized" do

    before do
      File.unlink('./book.bin')
    end

    its(:keyMap) { should be_empty }
  end
end
