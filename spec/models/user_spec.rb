require 'spec_helper'

describe User do
  before do
    @user = FactoryGirl.create(:user)
  end

  subject { @user }

  it { should respond_to :name }
  it { should respond_to :father_name }
  it { should respond_to :mother_name }
  it { should respond_to :address }
  it { should respond_to :date_of_birth }
  it { should respond_to :date_of_join }
  it { should respond_to :dob }
  it { should respond_to :doj }

  it "return dob as formatted date" do
    @user.dob.should == "13 Mar 1989"
  end

  it "return doj as formatted date" do
    @user.doj.should == "01 May 2011"
  end

  describe "when name is not given" do
    before { @user.name = " " }

    it { should_not be_valid }
  end

  describe "when father name is not given" do
    before { @user.father_name = " " }

    it { should_not be_valid }
  end

  describe "when mother name is not given" do
    before { @user.mother_name = " " }

    it { should_not be_valid }
  end

  describe "when dob is not given" do
    before { @user.date_of_birth = " " }

    it { should_not be_valid }
  end

  describe "when doj is not given" do
    before { @user.date_of_join = " " }

    it { should_not be_valid }
  end

  describe "when address is not given" do
    before { @user.address = " " }

    it { should_not be_valid }
  end
end