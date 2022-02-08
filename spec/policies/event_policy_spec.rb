require 'rails_helper'

RSpec.describe EventPolicy do
  let(:user) { FactoryBot.create(:user) }
  let(:user_owner) { FactoryBot.create(:user) }
  let(:event) { FactoryBot.create(:event, user: user_owner) }

  # объект тестирования (политика)
  subject { EventPolicy }

  context '#show when user in not an owner' do
    context 'and not authorized' do
      permissions :show? do
        it 'gives access' do
          is_expected.to permit(nil, Event)
        end
      end
    end

    context 'and authorized' do
      permissions :show? do
        it 'gives access' do
          is_expected.to permit(user, Event)
        end
      end
    end
  end

  context '#create' do
    context 'when user is not authorized' do
      permissions :create? do
        it 'doesnt give access' do
          is_expected.not_to permit(nil, Event)
        end
      end
    end

    context 'when user is authorized' do
      permissions :create? do
        it 'gives access' do
          is_expected.to permit(user, Event)
        end
      end
    end
  end

  context '#edit, #update and #destroy' do
    context 'when user not authorized' do
      permissions :edit?, :update?, :destroy? do
        it 'doesnt give access' do
          is_expected.not_to permit(nil, event)
        end
      end
    end

    context 'when user in not an owner' do
      permissions :edit?, :update?, :destroy? do
        it 'doesnt give access' do
          is_expected.not_to permit(user, event)
        end
      end
    end

    context 'when user in the owner' do
      permissions :edit?, :update?, :destroy? do
        it 'gives access' do
          is_expected.to permit(user_owner, event)
        end
      end
    end
  end
end
