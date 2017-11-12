require 'spec_helper'

describe User do
  subject { User.new(email: 'test@example.com',
                     first_name: 'Alex',
                     last_name: 'Smit',
                     middle_name: 'Alex',
                     phone: '+70000000000',
                     city: 'Kazan',
                     document: Rails.root.join("spec/files/man.png").open,
                     password: 'password') }

  describe "with all valid params" do
    it { expect(subject).to be_valid }
  end

  describe "without password" do
    before { subject.password = nil }

    it { expect{ subject.save! }.to raise_error(ActiveRecord::RecordInvalid, "Возникли ошибки: Password не может быть пустым") }
  end

  describe "without email" do
    before { subject.email = nil }

    it { expect{ subject.save! }.to raise_error(ActiveRecord::RecordInvalid, "Возникли ошибки: Email не может быть пустым") }
  end

  describe "with invalid email" do
    before { subject.email = 'invalid' }

    it { expect{ subject.save! }.to raise_error(ActiveRecord::RecordInvalid, "Возникли ошибки: Email имеет неверное значение") }
  end

  describe "without first_name" do
    before { subject.first_name = nil }

    it { expect{ subject.save! }.to raise_error(ActiveRecord::RecordInvalid, "Возникли ошибки: First name не может быть пустым") }
  end

  describe "without last_name" do
    before { subject.last_name = nil }

    it { expect{ subject.save! }.to raise_error(ActiveRecord::RecordInvalid, "Возникли ошибки: Last name не может быть пустым") }
  end

  describe "without middle_name" do
    before { subject.middle_name = nil }

    it { expect{ subject.save! }.to raise_error(ActiveRecord::RecordInvalid, "Возникли ошибки: Middle name не может быть пустым") }
  end

  describe "without phone" do
    before { subject.phone = nil }

    it { expect{ subject.save! }.to raise_error(ActiveRecord::RecordInvalid, "Возникли ошибки: Phone не может быть пустым, Phone  неправильный формат") }
  end

  describe "with invalid phone" do
    before { subject.phone = '8927343' }

    it { expect{ subject.save! }.to raise_error(ActiveRecord::RecordInvalid, "Возникли ошибки: Phone 8927343 неправильный формат") }
  end

  describe "without city" do
    before { subject.city = nil }

    it { expect{ subject.save! }.to raise_error(ActiveRecord::RecordInvalid, "Возникли ошибки: City не может быть пустым") }
  end

  describe "without document" do
    before { subject.document = nil }

    it { expect{ subject.save! }.to raise_error(ActiveRecord::RecordInvalid, "Возникли ошибки: Document не может быть пустым") }
  end
end