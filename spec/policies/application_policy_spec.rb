require 'rails_helper'

describe ApplicationPolicy do
  let(:user) { User.new }

  subject { described_class }

  context 'for a visitor' do
    let(:user) { nil }
    let(:hub) { create :hub }

    permissions '.scope' do
      it 'returns empty list' do
        create :hub
        expect(Pundit.policy_scope(user, Hub)).to be_empty
      end
    end

    permissions :show? do
      it 'grants access' do
        expect(subject).to permit(user, hub)
      end
    end

    permissions :create? do
      it 'denies access' do
        expect(subject).to_not permit(user, hub)
      end
    end

    permissions :update? do
      it 'denies access' do
        expect(subject).to_not permit(user, hub)
      end
    end

    permissions :destroy? do
      it 'denies access' do
        expect(subject).to_not permit(user, hub)
      end
    end
  end

  context 'for a vendor' do
    let(:user) { create(:vendor).user }
    let(:user_other) { create :user }
    let(:hub) { user.vendors.first.hub }

    permissions :show? do
      it 'grants access' do
        expect(subject).to permit(user, hub)
      end
    end

    permissions :create? do
      it 'denies access' do
        expect(subject).to_not permit(user_other, hub)
      end
    end

    permissions :update? do
      it 'denies access' do
        expect(subject).to_not permit(user_other, hub)
      end
    end

    permissions :destroy? do
      it 'denies access' do
        expect(subject).to_not permit(user_other, hub)
      end
    end
  end

  context 'for a client' do
    let(:user) { create(:client).user }
    let(:user_other) { create :user }
    let(:hub) { user.clients.first.organization.hub }

    permissions :show? do
      it 'grants access' do
        expect(subject).to permit(user, hub)
      end
    end

    permissions :create? do
      it 'denies access' do
        expect(subject).to_not permit(user_other, hub)
      end
    end

    permissions :update? do
      it 'denies access' do
        expect(subject).to_not permit(user_other, hub)
      end
    end

    permissions :destroy? do
      it 'denies access' do
        expect(subject).to_not permit(user_other, hub)
      end
    end
  end
end
