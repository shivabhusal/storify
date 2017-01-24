# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  name        :string
#  parent_id   :integer
#  description :string
#  metadata    :jsonb            default("{}")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should have_many :product_categories }
  it { should have_many :products }
  it { should have_many :children }
  it { should belong_to :parent }

  let!(:super_cat1) { create :category, name: 'Root Super cat1' }
  let!(:super_cat2) { create :category, name: 'Root Super cat2' }
  let!(:cat1) { create :category, name: 'Root cat1' }
  let!(:cat2) { create :category, name: 'Root cat2' }
  let!(:sub_cat1) { create :category, name: 'Sub cat1', parent: cat1 }
  let!(:sub_cat2) { create :category, name: 'Sub cat2', parent: cat2 }

  describe '.master' do
    it 'should return all the master categories having no parent; super parents' do
      expect(Category.master.ids).to eq([super_cat1.id, super_cat2.id, cat1.id, cat2.id])
    end
  end

  describe '.children' do
    it 'should return all the children categories except the super' do
      expect(Category.children.ids).to eq([sub_cat1.id, sub_cat2.id])
    end
  end
end
