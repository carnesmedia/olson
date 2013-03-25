require 'spec_helper'

describe Olson do
  it "exists (sanity check)" do
    Olson.should be
    Olson.class.should == Module
  end

  context "when using Draper" do
    pending "should render a model and all other fields" do
      decorated_user.class.should == UserDecorator
      decorated_user.model.should == user
      decorated_user.model_class.should == User
    end

    pending "should humanize a field" do
      user.status = "submitted"
      decorated_user.status.should == "Submitted"
    end
  end
end
