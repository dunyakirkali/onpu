require 'rails_helper'

RSpec.describe Jingle, type: :model do
  # Relations
  it { should belong_to(:user) }
end
