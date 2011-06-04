# -*- coding: utf-8 -*-
require_relative './spec_helper'
require 'TDDBC-Sap02-Legacy'

describe Database  do
  before do
    File.unlink('./book.bin')
  end

  context "when initialized" do
    its(:keyMap) { should be_empty }
    its(:offset) { should == 0}
    its(:list) { should be_empty }
  end

  context "when added one book" do
    before do
      @b1 = Book.new
      @b1.id = "001"
      @b1.title="刀語 第一話 絶刀・鉋"
      @b1.author="西尾 維新"
      @b1.isbn="9784062836111"
      @b1.status=CirculationStatus::BACKORDERED
      @database = Database.new
      @database.add(@b1)
    end
    subject { @database }
    it{ subject.find(@b1.id).should eql @b1 }
    its(:list) { should eql [@b1] }
  end
end
