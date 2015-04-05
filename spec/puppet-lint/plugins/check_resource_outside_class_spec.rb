require 'spec_helper'

describe 'resource_outside_class' do

  let(:class_msg) { 'resource found outside a class definition' }
  let(:define_msg) { 'resource found outside a defined type defintion' }
  let(no_class_or_define_msg) { 'resourcss exist but no class or defined type definition found in manifest')

  context 'with fix disabled' do

    context 'resource inside class definition' do
      let(:code) { "class foo{\nnotify{ 'resource in class': }\n}" }

      it 'should not detect any problems' do
        expect(problems).to have(0).problems
      end
    end

    context 'resource inside defined type definition' do
      let(:code) { "define bar{\nnotify{ 'resource in defined type': }\n}" }

      it 'should not detect any problems' do
        expect(problems).to have(0).problems
      end
    end

    context 'resource outside, after of a class definition' do
      let(:code) { "class foo{ }\nnotify{'badfoo': }" }

      it 'should create a warning' do
        expect(problems).to contain_warning(class_msg).on_line(2)
      end
    end

    context 'resource outside of, after, a defined type' do
      let(:code) { "define bar{}\nnotify{'resource after define':}\n}" }

      it 'should create a warning' do
        expect(problems).to contain_warning(define_msg).on_line(2)
      end
    end

    context 'resource outside of, before, a class definition' do
      let(:code) { "notify{'badfoo': }\nclass foo{ }\n" }

      it 'should create a warning' do
        expect(problems).to contain_warning(class_msg).on_line(1)
      end
    end

    context 'resource outside, before, of a defined type' do
      let(:code) { "notify{'resource before define':}\ndefine bar{}" }

      it 'should create a warning' do
        expect(problems).to contain_warning(define_msg).on_line(1)
      end
    end

    context 'resource with no class or define present' do
      let(:code) { "notify{'no classes!': }" }

      it 'should create a warning' do
        expect(problems).to contain_warning(no_class_or_define_msg).on_line(1)
      end
    end

  end
end
