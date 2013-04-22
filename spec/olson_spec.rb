require 'spec_helper'

describe Olson do
  context "when using Draper and ActiveModel" do
    let(:object) { User.new }
    let(:decorated) { UserDecorator.decorate(object) }

    before { object.status = 'submitted' }

    it "humanizes a field" do
      decorated.status.should == "Submitted"
    end

    it 'humanizes with I18n when specified' do
      object.status = 'rejected'
      decorated.status.should == 'OMG Fail'
    end

    it 'humanizes options for select' do
      UserDecorator.status_options.should == [
        ["Approved", "approved"],
        ["OMG Fail", "rejected"],
      ]
    end

    context 'overriding the default behaviour' do
      let(:decorated) { CustomUserDecorator.decorate(object) }

      it "humanizes a field" do
        decorated.status.should == "SUBMITTED"
      end

      it 'humanizes options for select' do
        CustomUserDecorator.status_options.should == [
          ["APPROVED", "approved"],
          ["OMG Fail", "rejected"],
        ]
      end
    end

  end

  context 'without draper' do
    let(:object) { Human.new }
    let(:decorated) { HumanDecorator.new(object) }

    it 'humanizes a field' do
      object.status = 'submitted'
      decorated.status.should == 'Submitted'
    end
  end

end
