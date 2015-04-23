require_relative './spec_helper'

describe 'google', type: 'feature', screenshots: true do 

  it 'has a homepage' do 
    visit '/'
    check_visual_regression_for 'homepage'
  end

end
