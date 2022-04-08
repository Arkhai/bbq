require 'rails_helper'

RSpec.describe EventPolicy do
  let(:guest) { UserContext.new(nil, {}) }
  let(:guest_with_pin) { UserContext.new(nil, cookies) }
  let(:user) { UserContext.new(FactoryBot.create(:user), {}) }
  let(:user_with_pin) { UserContext.new(FactoryBot.create(:user), cookies) }
  let(:user_owner) { UserContext.new(FactoryBot.create(:user), {}) }
  let(:event) { FactoryBot.create(:event, user: user_owner.user) }
  let(:event_with_pin) { FactoryBot.create(:event, user: user_owner.user, pincode: '1111') }
  let(:cookies) { { "events_#{event_with_pin.id}_pincode" => '1111' } }

  # объект тестирования (политика)
  subject { EventPolicy }

  context '#show when user in not an owner' do
    context 'and not authorized' do
      permissions :show? do
        it 'gives access' do
          is_expected.to permit(guest, event)
        end
      end
    end

    context 'and authorized' do
      permissions :show? do
        it 'gives access' do
          is_expected.to permit(user, event)
        end
      end
    end
  end

  context '#show when user in not an owner and event has a pincode' do
    context 'user is not authorized' do
      permissions :show? do
        it 'doesnt give access' do
          is_expected.not_to permit(guest, event_with_pin)
        end
      end
    end

    context 'user is not authorized and has a pincode' do
      permissions :show? do
        it 'gives access' do
          is_expected.to permit(guest_with_pin, event_with_pin)
        end
      end
    end

    context 'and authorized' do
      permissions :show? do
        it 'doesnt give access' do
          is_expected.not_to permit(user, event_with_pin)
        end
      end
    end

    context 'and authorized and has a pincode' do
      permissions :show? do
        it 'gives access' do
          is_expected.to permit(user_with_pin, event_with_pin)
        end
      end
    end
  end

  context '#create' do
    context 'when user is not authorized' do
      permissions :create? do
        it 'doesnt give access' do
          is_expected.not_to permit(guest, Event)
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
          is_expected.not_to permit(guest, event)
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
