require 'spec_helper'

describe Category do
  it { should have_many(:businesses) }
end
