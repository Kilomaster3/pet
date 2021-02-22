# frozen_string_literal: true

require_relative '../lib/human'
require 'faker'

describe Human do
  let(:pet) { double('pet') }
  let(:job) { double('job') }
  let(:human) { described_class.new(job: job, pet: pet, money: 5) }

  describe '#create' do
    it 'creates a new human' do
      expect(human).to be_kind_of(Human)
    end
  end

  describe 'Human - Animal' do
    context 'When he feeds animal' do
      before do
        allow(pet).to receive(:eat) { 45 }
      end

      it 'man feeds the animal' do
        expect(human.feed_pet).to eq('Pet is fed')
      end
    end

    context 'When animal is full' do
      before do
        expect(pet).to receive(:eat) { 'I am not hungry' }
      end

      it 'animal is fed' do
        expect(human.feed_pet).to eq('Pet is fed')
      end
    end

    context 'When human have not enough money' do
      before do
        expect(human).to receive(:money) { 0 }
      end

      it 'the person does not have enough money' do
        expect(human.feed_pet).to eq('You not have enough money to feed your pet!')
      end
    end
  end

  describe 'Human - Job' do
    context 'When human work' do
      before do
        allow(job).to receive(:get_salary) { 0 }
      end

      it 'man feeds the animal' do
        expect(human.work).to eq('You get salary')
      end
    end
  end
end
