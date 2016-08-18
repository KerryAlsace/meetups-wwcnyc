require 'spec_helper'

describe Meetups do
  it 'has a version number' do
    expect(Meetups::VERSION).not_to be nil
  end

  # it 'does something useful' do
  #   expect(false).to eq(true)
  # end
end

describe Meetups::Event do
  it 'is a class' do
    expect(Meetups::Event).not_to be nil
  end
end

describe Meetups::CLI do
  it 'is a class' do
    expect(Meetups::CLI).not_to be nil
  end
end