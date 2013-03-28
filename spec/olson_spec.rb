require 'spec_helper'

describe Olson do
  context "when using Draper" do

    context "without an ActiveModel model" do
      class Human
        attr_accessor :status
        def self.model_name
          OpenStruct.new(i18n_key: "human")
        end

        def self.status_options
          %w[ approved rejected ]
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
        HumanDecorator.source_class.should == Human
      end

      it "should humanize a status" do
        human.status = "approved"
        decorated_human.status.should == "Approved"
      end

      it 'humanizes options for select' do
        HumanDecorator.status_options.should == [
          ["Approved", "approved"],
          ["Rejected", "rejected"],
        ]
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
        UserDecorator.source_class.should == User
      end

      it "should humanize a field" do
        user.status = "submitted"
        decorated_user.status.should == "Submitted"
      end
    end
  end
end
