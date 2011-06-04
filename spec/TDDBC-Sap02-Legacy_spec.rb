# -*- coding: utf-8 -*-
require_relative './spec_helper'
require 'TDDBC-Sap02-Legacy'

describe Database  do
  before do
    path = './book.bin'
    File.unlink(path) if File.exist?(path)
  end

  context "when initialized" do
    its(:keyMap) { should be_empty }
    its(:offset) { should == 0}
    its(:list) { should be_empty }
  end

  describe "add books" do
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

    context "when added one book" do
      it{ subject.find(@b1.id).should eql @b1 }
      its(:list) { should eql [@b1] }
      it { subject.find("000").should be_nil }
    end

    context "when added two books" do
      before do
        @b2 = Book.new
        @b2.id = "002"
        @b2.title="刀語 第二話 斬刀・鈍"
        @b2.author="西尾 維新"
        @b2.isbn="9784062836043"
        @database.add(@b2)
      end

      it{ subject.find(@b2.id).should eql @b2 }
      its(:list) { should eql [@b1, @b2] }
    end
  end
end
