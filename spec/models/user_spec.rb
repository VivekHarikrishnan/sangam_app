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
  xit { should respond_to :dob }
  xit { should respond_to :doj }
end