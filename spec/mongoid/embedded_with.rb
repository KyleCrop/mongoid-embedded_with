#encoding: utf-8
require 'spec_helper'

module Mongoid
  describe EmbeddedWith do
    it 'should offer the #embedded_with_many macro' do
      Teacher.should respond_to(:embedded_with_many)
    end
  end # EmbeddedWith
end # Mongoid
