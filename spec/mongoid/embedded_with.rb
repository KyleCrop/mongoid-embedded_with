#encoding: utf-8
require 'spec_helper'

module Mongoid
  describe EmbeddedWith do
    it 'should offer the #embedded_with_many macro' do
      Teacher.should respond_to(:embedded_with_many)
    end

    context '#push' do
      let(:teacher) do
        teacher = Teacher.new(name: 'Alice')
        teacher.save
        teacher
      end

      let(:student) do
        student = Student.new(name: 'Bob')
        student.save
        student
      end

      it 'should let a student be pushed to a teacher' do
        lambda do
          teacher.students.push student
        end.should_not raise_error
      end
    end # '#push'
  end # EmbeddedWith
end # Mongoid
