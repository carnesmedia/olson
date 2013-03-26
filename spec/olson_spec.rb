require 'spec_helper'

describe Olson do
  it "exists (sanity check)" do
    Olson.should be
    Olson.class.should == Module
  end

  context "when using Draper" do

    context "without an ActiveModel model" do
      class Human
        attr_accessor :status
        def self.model_name
          OpenStruct.new(i18n_key: "I am a stubbed key")
        end
      end

      class HumanDecorator < Draper::Decorator
        decorates :human
        humanizes :status
      end

      let(:human) { Human.new }
      let(:decorated_human) { HumanDecorator.decorate(human) }

      it "should render a decorated model" do
        decorated_human.class.should == HumanDecorator
        decorated_human.model.should == human
        decorated_human.model.class.should == Human
      end

      it "should humanize a status" do
        human.status = "approved"
        decorated_human.status.should == "Approved"
      end
    end

    context "with an ActiveModel model" do
      require 'active_model'

      class User
        include ActiveModel::Validations
        attr_accessor :status
      end

      class UserDecorator < Draper::Decorator
        decorates :user
        humanizes :status
      end

      let(:user) { User.new }
      let(:decorated_user) { UserDecorator.decorate(user) }

      it "should render a decorated model" do
        decorated_user.class.should == UserDecorator
        decorated_user.model.should == user
        decorated_user.model.class.should == User
      end

      it "should humanize a field" do
        user.status = "submitted"
        decorated_user.status.should == "Submitted"
      end
    end
  end
end
