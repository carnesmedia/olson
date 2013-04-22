require 'spec_helper'

describe Olson do
  context "when using Draper and ActiveModel" do
    let(:object) { User.new }
    let(:decorated) { UserDecorator.decorate(object) }

    it "humanizes a field" do
      object.status = "submitted"
      decorated.status.should == "Submitted"
    end

    it 'humanizes options for select' do
      UserDecorator.status_options.should == [
        ["Approved", "approved"],
        ["Rejected", "rejected"],
      ]
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
